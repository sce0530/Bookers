class BooksController < ApplicationController

  def top
  end

  def new
    @book = Book.new
  end

  def create

    book = Book.new(book_params)

    if book.save
      flash[:notice] = "成功しました"
      redirect_to book_path(book.id)
    else
      flash[:notice] = "登録に失敗しました"
      render :new
    end

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
