class BooksController < ApplicationController
  before_action :correct_user,only:[:edit,:update,:destroy]
  before_action :authenticate_user! 

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @bookn = Book.new
    @user = @book.user
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      flash[:notice]= "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      flash[:notice]= "error!"
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice]= "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      flash[:notice]= "error!"
      redirect_to book_path(book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :opinion)
  end

  def correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user.id
      redirect_to book_path(book.id)
    end
  end
end
