class Game < ApplicationRecord

  has_many :joins, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :member

  attachment :image

  validates :title, {presence:true, length:{maximum:30}}
  validates :number,numericality: { only_integer: true,　greater_than: 0, less_than: 100}
  validates :address, {presence:true, length:{maximum:80}}
  validates :introduction, {presence:true, length:{maximum:130}}

  def joined_by?(member)
      joins.where(member_id: member.id).exists?
  end

  def self.search(keyword)
    where(["title like? OR introduction like? OR address like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  def create_notification_join!(current_member)
        temp = Notification.where(["visitor_id = ? and visited_id = ? and game_id = ? and action = ? ", current_member.id, member_id, id, 'join'])
      if temp.blank?
        notification = current_member.active_notifications.new(
        game_id: id,
        visited_id: member_id,
        action: 'join'
        )
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
      notification.save if notification.valid?
      end
  end

  def create_notification_comment!(current_member, post_comment_id)
        temp_ids = PostComment.select(:member_id).where(game_id: id).where.not(member_id: current_member.id).distinct
        temp_ids.each do |temp_id|
          save_notification_comment!(current_member, post_comment_id, temp_id['member_id'])
        end
      save_notification_comment!(current_member, post_comment_id, member_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_member, post_comment_id, visited_id)
        notification = current_member.active_notifications.new(
          game_id: id,
          post_comment_id: post_comment_id,
          visited_id: visited_id,
          action: 'comment'
        )
        if notification.visitor_id == notification.visited_id
           notification.checked = true
        end
      notification.save if notification.valid?
  end

end
