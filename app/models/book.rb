
class Book < ActiveRecord::Base
  belongs_to :user
  scope :most_recent, -> { limit(10).order('author desc') }

  def self.search(q)
    where(['author LIKE ? OR title LIKE ?', "%#{q}%", "%#{q}%"])
  end

  def title=(value)
    super # does normal code for title=
    # TODO: only save a new book_cover_url, if title has changed
    self.book_cover_url = get_book_cover_url(self.title)
  end

  def get_book_cover_url(title)
    missing_cover_url = 'missing_cover.png'
    safe_title = URI::encode(title)
    my_key = ENV["goodreads_api"]
    book_url = "https://www.goodreads.com/search.xml?key=#{my_key}&q=#{safe_title}"

    search_results = HTTParty.get(book_url)

    begin
      book_data = search_results["GoodreadsResponse"]["search"]["results"]["work"][0]["best_book"]
      book_data.fetch("image_url", missing_cover_url)
    rescue NoMethodError # missing hash key
      missing_cover_url
    end
  end
 

  # def review
  #   title = self.title.to_s.gsub(" ", "+")
  #   author = self.author.to_s.gsub(" ", "+")
  #   xml = "https://www.goodreads.com/book/title.xml?author=#{author}&key=lZx6I0xHirEZVRs8Xg2iPg&title=#{title}"
  #   # xml.map do |image|
  #   #   image.find(image_url)
  #   # end
  # end

  # def cover_photo
  #   title = self.title.to_s.gsub(" ", "+")
  #   xml = HTTParty.get("https://www.goodreads.com/search.xml?key=lZx6I0xHirEZVRs8Xg2iPg&q=#{title}")
  #   # xml.each do |image|
  #   #   xml.each do |x|
  #   #     xml.each do |y|
  #   #       xml.each do |m|
  #   #         image.find(:image_url)
  #   #       end
  #   #     end
  #   #   end
  #   # end
  #   xml["GoodreadsResponse"]["Request"][:search]["query"][:results]["work"][0][:image_url]
  #   # ["best_book type=\"Book\""]

  # end
end
