# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

20.times do
	User.create!(email: Faker::Internet.email, phone_number: "0033#{rand(6..7)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}", description: Faker::Lorem.word)
end#Faker::Number.number(digits: 10)
puts "users créés"
10.times do 
	City.create!(name: Faker::Address.city, zip_code: "#{rand(10..95)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}")
end
puts "villes créées"
50.times do
	Listing.create!(available_beds: rand(1..8),price: rand(1..400), description: Faker::Lorem.paragraph_by_chars(number: 140), has_wifi: ["true","false"].sample, welcome_message: Faker::Lorem.sentences, admin_id: User.all.sample.id, city_id: City.all.sample.id)
end
puts "listings créés"

#dans le passé
Listing.all.each do |list| 
	Reservation.create(start_date: "2019-10-20 13:17:42",end_date: "2019-10-23 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
	Reservation.create(start_date: "2019-09-20 13:17:42",end_date: "2019-09-23 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
	Reservation.create(start_date: "2019-08-20 13:17:42",end_date: "2019-08-23 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
	Reservation.create(start_date: "2019-07-20 13:17:42",end_date: "2019-07-23 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
	Reservation.create(start_date: "2019-06-20 13:17:42",end_date: "2019-06-23 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
end
Listing.all.each do |list| 
	Reservation.create(start_date: "2019-10-26 13:17:42",end_date: "2019-10-28 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
	Reservation.create(start_date: "2020-09-20 13:17:42",end_date: "2020-09-28 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
	Reservation.create(start_date: "2020-08-20 13:17:42",end_date: "2020-08-28 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
	Reservation.create(start_date: "2020-07-20 13:17:42",end_date: "2020-07-28 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
	Reservation.create(start_date: "2020-06-20 13:17:42",end_date: "2020-06-28 13:17:42",listing_id: list.id,guest_id:User.all.sample.id)
end
puts "reservations créées"