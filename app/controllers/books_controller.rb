
class BooksController < ApplicationController

  def index
    # @books = Book.most_recent
    @books = current_user.books
    # @books.each do |book|
    #   cover(book.title)
    # end
    # get_book_cover(params[:title])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def search
    @results = current_user.books.search(params[:q])
  end
  # <%= f.hidden_field :user_id, :value => current_user.id %>

  def browse
    @results = Book.search
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
      flash[:notice] = "Updated Book Successfully!"
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
      flash[:notice] = "Book added to shelf!"
    else
      render :new
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:notice] = "Book removed from shelf!"
  end

########################################################################
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :author, :user_id)
  end

  # def cover(title)
  #   title = title.gsub(" ", "+")
  #   @xml = HTTParty.get("https://www.goodreads.com/search.xml?key=lZx6I0xHirEZVRs8Xg2iPg&q=#{title}")
  #   @xml["GoodreadsResponse"]["Request"][:search]["query"][:results]["work"][0][:image_url]
  # end
 
########################################################################
end #end class BooksController

# puts "What's the title?"
# answer = gets.chomp

# def stuff(url)
#   results = HTTParty.get(url)
#   better_results = results["GoodreadsResponse"]["search"]["results"]["work"][0]["best_book"]["image_url"]
# end

# puts stuff("https://www.goodreads.com/search.xml?key=lZx6I0xHirEZVRs8Xg2iPg&q=#{answer}")


# Randy's code:
# def get_game_data(title)
#       title = title.gsub(" ", "+")
#       @game = HTTParty.get("http://www.giantbomb.com/api/search/?api_key=#{ENV['giant_bomb_api_key']}&format=json&query=#{title}&resources=game&limit=1")
#       @deck = @game["results"][0]["deck"]
#       @image = @game["results"][0]["image"]["super_url"]
#       @title = title
# end