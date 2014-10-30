
class Book < ActiveRecord::Base
  belongs_to :user
  scope :most_recent, -> { limit(10).order('author desc') }

  def self.search(q)
    where(['author LIKE ? OR title LIKE ?', "%#{q}%", "%#{q}%"])
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
