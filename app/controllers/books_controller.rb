class BooksController < ApplicationController

  def show
  	  @book = Book.find(params[:id])
  end

  def index
  	  @books = Book.all.order(id: "DESC")
  	  @newbook = Book.new
  end

  def create
  	  book = Book.new(book_params)
      book.save
      flash[:success] = 'Book was successfully updated.'
      redirect_to book_path(book.id)
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      flash[:success] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end


  private

  def book_params
      params.require(:book).permit(:title,:body)
  end
end
