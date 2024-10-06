# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 15 }

  validates :description, presence: true
  validates :description, length: { minimum: 2, maximum: 30 }

  belongs_to :user
  has_many :tasks
end
