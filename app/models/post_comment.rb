class PostComment < ApplicationRecord

  has_many :notifications,dependent: :destroy
  belongs_to :game
  belongs_to :member

  validates :comment, {presence:true, length:{maximum:175}}

end