class Game < ApplicationRecord

  has_many :joins, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :member

  attachment :image

end
