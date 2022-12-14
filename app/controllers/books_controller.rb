class BooksController < ApplicationController
  def index
    @books =Book.all
    @book =Book.new
  end


  def create
    @books = Book.all
    @book =Book.new(book_params)
    if@book.save
    redirect_to book_path(@book),notice:"Book was successfully created."
    else
      flash.now[:error] =@book.errors.full_messages
      render:index
    end
  end


  def show
    @book =Book.find(params[:id])
  end

  def edit
    @book =Book.find(params[:id])
  end

  def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice:"Book was successfully updated."
    else
      flash.now[:error] =@book.errors.full_messages
      @books = Book.all
      render:edit
    end
  end

  def destroy
    book= Book.find(params[:id]) #データ(レコード)を１件取得
    book.destroy#データ(レコード)を削除
    redirect_to books_path, notice:"Book was successfully destroyed."  #投稿一覧画面へリダイレクト

  end
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
