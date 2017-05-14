class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id).order(:name)
  end

  def show
    @user = User.find(params[:id])
    @locations = @user.locations.is_public
  end
end
