# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

jack = User.create!(
  email: 'dummy1@example.com', password: 'password1'
)

emi = User.create!(
  email: 'dummy2@example.com', password: 'password2'
)

mike = User.create!(
  email: 'dummy3@example.com', password: 'password3'
)

3.times do
  jack.boards.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 100)
  )
end

3.times do
  emi.boards.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 100)
  )
end

3.times do
  mike.boards.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 100)
  )
end