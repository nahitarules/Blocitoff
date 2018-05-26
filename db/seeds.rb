# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
  5.times do
    user = User.create!(
    email:        Faker::Internet.email,
    password:     Faker::Internet.password,
    confirmed_at: Time.now
    )
  end
  users = User.all

  15.times do
    item = Item.create!(
      user:  users.sample,
      name:  Faker::Lorem.sentence
      )
    end

    puts "Seeds finished"
    puts "#{User.count} users created"
    puts "#{Item.count} items created"
