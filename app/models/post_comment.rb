class PostComment < ApplicationRecord
  
  has_many :notifications,dependent: :destroy
  belongs_to :game
  belongs_to :member
  
end