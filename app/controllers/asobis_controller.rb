class AsobisController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(asobi_params)
    game.save
    redirect_to asobi_path(asobi.id)
  end

end
