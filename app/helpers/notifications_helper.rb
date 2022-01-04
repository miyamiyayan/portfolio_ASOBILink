module NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
      # your_item = link_to 'あなたの投稿', member_item_path(notification), style:"font-weight: bold;"
    @visiter_comment = notification.comment_id
  #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "join" then
        "(notification.visiter.name)が"+tag.a('あなたの投稿', href:asobi_path(notification.game_id), style:"font-weight: bold;")+"に参加希望をしました"
      when "comment" then
        @comment = Comment.find_by(id: @visiter_comment)&.content
        "(notification.visiter.name)が"+tag.a('あなたの投稿', href:asobi_path(notification.game_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

end
