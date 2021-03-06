class TrackerController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:updatecurrentloc, :updatestatus, :pathdata]
  
  def index
    @locations = random.sort_by &:id
  end

  def order
    render json: Order.find(params[:id]) and return
  end

  def generate
    locations = random.sort_by &:id
    render json: locations and return
  end

  def updatecurrentloc
    active_order     = params[:order_id]
    current_location = params[:current_loc]
    order_data       = get_active_order(active_order.to_s)
    if order_data
        order_data['path_followed'].push(current_location)
        update_order_in_redis(active_order, order_data)
    end
  end

  def updatestatus
    active_order     = params[:order_id]
    order_state      = params[:order_state]
    order_data       = get_active_order(active_order.to_s)
    if order_data
        order_data['status'] = order_state.upcase
        update_order_in_redis(active_order, order_data)
    end
  end

  def pathdata
    orders = params[:orders]
    orders_data = []
    orders.to_a.each do |order|
      orders_data.push(get_active_order(order))
    end
    path_travelled = []
    orders_data.each do |order|
      if order['status'] == 'FINISHED_DELIVERY'
        order['path_followed'].to_a.each do |path|
          path_travelled.push(path) 
        end
      end
    end
    render json: path_travelled.compact and return
  end

  private
  def random
    orders = Order.order('RANDOM()').limit(3)
    store_orders_in_redis(orders)
    return orders
  end

  def store_orders_in_redis(orders)
    $redis.flushdb
    orders.each do |order|
        status = 'ON_DELIVERY'
        $redis.set "order_id::#{order.id}", {latlng: "#{order.latitude}:#{order.longitude}", status: status, path_followed: []}.to_json
    end
  end

  def get_active_order(active_order)
    JSON.parse($redis.get("order_id::#{active_order}")) rescue nil
  end

  def update_order_in_redis(active_order, order_data)
    $redis.set "order_id::#{active_order}", order_data.to_json
  end
end
