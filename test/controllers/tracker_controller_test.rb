require 'test_helper'

class TrackerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tracker_index_url
    assert_response :success
  end

end
