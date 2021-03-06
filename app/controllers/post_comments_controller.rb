class PostCommentsController < ApplicationController

  before_action :authenticate_member!

  def create
    @game = Game.find(params[:asobi_id])
    @comment = current_member.post_comments.new(post_comment_params)
    @comment.game_id = @game.id
    @comment.save
    @game.create_notification_comment!(current_member, @comment.id)
    redirect_to asobi_path(@game)
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to asobi_path(params[:asobi_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
