class UsersController < ApplicationController
  before_action :correct_user, only: [:edit,:update]

  before_action :authenticate_user! 

  def index 
    @book = Book.new
    @users = User.all
    @books = Book.all
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
     redirect_to user_path(@user.id)
   else 
    render action: :edit
  end
end

private
def user_params
  params.require(:user).permit(:name,:profile_image,:intro)
end

def correct_user
  user = User.find(params[:id])
  if current_user != user
    redirect_to user_path
  end
end
end

