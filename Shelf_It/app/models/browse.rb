class Browse <ActiveRecord::Base

  def self.search(q)
    where(['author LIKE ? OR title LIKE ?', "%#{q}%", "%#{q}%"])
  end
end
