# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Book.create(title: (Faker::Book.title), author: (Faker::Book.author), description: (Faker::Hipster.sentences(3)), ranked: 0)
end

10.times do
  Movie.create(title: (Faker::Superhero.power), author: (Faker::Superhero.name), description: (Faker::Hacker.say_something_smart), ranked: 0)
end

10.times do
  Album.create(title: (Faker::Space.galaxy), author: (Faker::Space.star), description: (Faker::StarWars.quote), ranked: 0)
end
