class Food < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # food.liked_usersでfoodを「いいね」したユーザー一覧を取得
  has_many :liked_users, through: :likes, source: :user
  validates :name, presence: true
  mount_uploader :image, ImageUploader

  # foodをuserが「いいね」しているときはtrue
  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
