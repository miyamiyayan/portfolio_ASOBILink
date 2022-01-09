class AsobisController < ApplicationController

  def index
    @games = Game.where(is_active: true).order(updated_at: :desc).page(params[:page]).per(9)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.member_id = current_member.id
    @game.save
    redirect_to asobis_path
  end

  def show
    @game = Game.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @game = Game.find(params[:id])
      if current_member == @game.member
        render :edit
      else
        redirect_to asobis_path
      end
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)
    redirect_to asobi_path
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to asobis_path
  end

  def search
    @keyword = params[:keyword]
    @games = Game.search(params[:keyword])
      render :index
  end

private

 def game_params
   params.require(:game).permit(:member_id, :title, :address, :number, :image, :introduction, :is_active)
 end

end
