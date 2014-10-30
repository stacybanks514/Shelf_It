class Book <ActiveRecord::Base
  belongs_to :user
  scope :most_recent, -> { limit(10).order('author desc') }
  
  def self.search(q)
    where(['author LIKE ? OR title LIKE ?', "%#{q}%", "%#{q}%"])
  end
end
