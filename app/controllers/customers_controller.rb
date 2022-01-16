class CustomersController < ApplicationController

  before_action :authenticate_member!

  def edit
    @member = Member.find(current_member.id)
  end

  def show
    @member = Member.find(current_member.id)
    @games = Game.where(member_id: current_member.id).order(updated_at: :desc).page(params[:page]).per(10)
    @join = Join.where(member_id: current_member.id).order(updated_at: :desc).page(params[:page]).per(10)
  end

  def update
    member = Member.find(current_member.id)
    member.update(member_params)
    redirect_to customers_path
  end

  def confirm
    @member = Member.find(current_member.id)
  end

  def withdraw
    member = Member.find(current_member.id)
    member.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
   def member_params
     params.require(:member).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :user_name, :email, :is_active)
   end
end