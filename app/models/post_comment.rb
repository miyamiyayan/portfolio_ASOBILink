class PostComment < ApplicationRecord
  
  belongs_to :game
  belongs_to :member
  
end