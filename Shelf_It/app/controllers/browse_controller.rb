class BrowseController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @books = Book.all
  end

  def search
    @browse_search = Book.all
    @browse_search.search(params[:q])
  end
end