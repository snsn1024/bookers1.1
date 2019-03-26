class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	if book.save
      flash[:notice]= "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      render action: :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id),notice: "Book was successfully updated."
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/book'
  end

  private
  
  def book_params
  	params.require(:book).permit(:title, :opinion)
  end
end
