# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Section.count == 0
  puts "Seeding section data..."
  %w(Breakfast Lunch Dinner Drinks).each do |name|
    Section.create!(name: name)
  end

else
  puts "You already have some section data"
end


10.times do |i|
  FoodItem.create!(
      :name => Faker::Food.ingredient,
      :description => Faker::Lorem.sentence,
      :price => Faker::Number.between(5, 20),
      :section_id => Faker::Number.between(1, 4),
      :image_url => ''
  )
end
puts "10 food items added. "
