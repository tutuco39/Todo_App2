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
  validates :title, length: { minimum: 2, maximum: 25 }

  validates :description, presence: true
  validates :description, length: { minimum: 2, maximum: 200 }

  validates :deadline, presence: true

  belongs_to :user
  belongs_to :board

  has_many :comments, dependent: :destroy
  has_one_attached :eyecatch

  def comment_count
    comments.count
  end

end
