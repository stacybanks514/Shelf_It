class BrowseController < ApplicationController
  def index
    @books = Book.all
    @display_books = Book.all
  end

  def show
    @books = Book.all
  end

  def search
    
    books = Book.all
    @results = books.search(params[:q])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :author, :user_id)
  end
end #End class