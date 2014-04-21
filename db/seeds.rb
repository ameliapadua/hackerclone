# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
4.times do
password = '12345678'
User.create(name: Faker::Team.creature,
              email: Faker::Internet.email,
              password: password,
              password_confirmation: password)
Post.create(title: Faker::Lorem.sentence,
            content: Faker::Lorem.paragraph,
            url: Faker::Internet.url,
            user_id: rand(1..4)
  )

Comment.create(content: Faker::Lorem.sentences(3).join(' '),
                post_id: rand(1..4),
                user_id: rand(1..4))
end