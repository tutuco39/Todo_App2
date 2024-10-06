# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  deadline    :date
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 15 }

  validates :description, presence: true
  validates :description, length: { minimum: 2, maximum: 100 }

  validates :deadline, presence: true

  belongs_to :user
  belongs_to :board

  has_one_attached :eyecatch

end
