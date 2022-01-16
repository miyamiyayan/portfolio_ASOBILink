class JoinsController < ApplicationController

  before_action :authenticate_member!

  def create
    @game = Game.find(params[:asobi_id])
    join = current_member.joins.new(game_id: @game.id)
    join.save
    @game.create_notification_join!(current_member)
  end

  def destroy
    @game = Game.find(params[:asobi_id])
    join = current_member.joins.find_by(game_id: @game.id)
    join.destroy
  end

end
