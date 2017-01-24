# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed the Initial addresses into the DB
addresses = ['1 Raffles Quay, Singapore', '1 Telok Ayer, Singapore', '10 Anson Road, Singapore', '8 Marina Boulevard, Singapore', '6 Battery Road, Singapore']

addresses.each do |address|
    Order.find_or_create_by(address: address)
end