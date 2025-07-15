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

  # def comment_user_avatars
  #   # task.user以外のコメントしたユーザーのavatarを取得
  #   comments.map do |comment|
  #     comments.map(&:user_id)
  #     comment_user = comment.user
  #       if comment_user != self.user && comment_user.profile&.avatar&.attached?
  #         comment_user.profile.avatar
  #       end
  #   end.compact  # nilの要素を取り除く
  # end

  def comment_user_avatars
    comments.map(&:user).uniq.select do |comment_user|
      comment_user != self.user && comment_user.profile&.avatar&.attached?
    end.map do |comment_user|
      comment_user.profile.avatar
    end
  end
  

end
