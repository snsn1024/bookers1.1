class UsersController < ApplicationController

  def index 
    @book = Book.new
  	@users = User.all
    @books = Book.all
  end

  def show
  	@user = User.find_by(id: params[:id])
    @book = Book.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

private
def user_params
	params.require(:user).permit(:name,:profile_image)
end
end

