# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Faker::Config.locale = 'en'

users = User.all
boards = Board.all
tasks = Task.all

# 5.times do
#   User.create!(
#     email: Faker::Internet.unique.email,
#     password: 'aa1234',
#     password_confirmation: 'aa1234'
#   )
# end

# 2.times do
#   Board.create!(
#     name: Faker::Lorem.sentence(word_count: 2),
#     description: Faker::Lorem.sentence(word_count: 4),
#     user_id: users.sample.id  # ランダムなユーザーと紐づけ
#   )
# end

# 10.times do
#   Task.create!(
#     title: Faker::Lorem.sentence(word_count: 2),
#     description: Faker::Lorem.sentence(word_count: 25),
#     deadline: Faker::Date.forward(days: rand(1..30)),  # 1〜30日後のランダムな日付
#     user_id: users.sample.id,  # ランダムなユーザー
#     board_id: boards.sample.id  # ランダムなBoard
#   )
# end

# 50.times do
#   Comment.create!(
#     content: Faker::Lorem.sentence(word_count: 10),
#     user_id: users.sample.id,  # ランダムなユーザーID
#     task_id: tasks.sample.id  # ランダムなTask ID
#   )
# end
