class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
  end

end