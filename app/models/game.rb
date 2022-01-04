class Game < ApplicationRecord

  has_many :joins, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :member

  attachment :image


  def joined_by?(member)
      joins.where(member_id: member.id).exists?
  end

end
