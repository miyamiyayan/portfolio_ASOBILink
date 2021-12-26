class JoinsController < ApplicationController

  def create
    game = Game.find(params[:asobi_id])
    join = current_member.joins.new(game_id: game.id)
    join.save
    redirect_to asobi_path(game)
  end

  def destroy
    game = Game.find(params[:asobi_id])
    join = current_member.joins.find_by(game_id: game.id)
    join.destroy
    redirect_to asobi_path(game)
  end

end
