class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :likes, dependent: :destroy
  # user.liked_foodsでuserが「いいね」しているメッセージ一覧を取得
  has_many :liked_foods, through: :likes, source: :food
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
