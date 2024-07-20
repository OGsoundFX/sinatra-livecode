puts "Destroying All Restaurants"
Restaurant.destroy_all

# Faker
require "faker"

puts "Creating 10 new Restaurants with Faker"

10.times do
  Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.full_address, rating: rand(1..5))
end

puts "#{Restaurant.count} new restaurants were successfully created"
