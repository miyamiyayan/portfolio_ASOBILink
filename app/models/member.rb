class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :games, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, {presence:true, length:{maximum:20}}
  validates :user_name, {presence:true, length:{maximum:30}, uniqueness: true}
  validates :email, {presence:true}



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
