class BrowseController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @books = Book.all
  end

  def search
    # @browse_search = Book.all
    # @browse_search.search(params[:q])
    books = Book.all
    # user = Book.user_id.find()
    # @user_name = @book.user_id.name
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