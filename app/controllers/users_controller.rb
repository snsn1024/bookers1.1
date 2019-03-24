class UsersController < ApplicationController
  def index
  	@user = User.all
  def show
  	@user = User.find(params[:id])
  end
end
