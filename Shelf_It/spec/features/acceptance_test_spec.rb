require 'rails_helper'


  # def create_book
  #   Book.create!(
  #     title: 'Test Book',
  #     author: 'John Doe',
  #   )
  # end
  # def create_user
  # end
  
  feature "Welcome Page" do
    scenario "visit the welcome page" do
      visit root_path
  
      expect(page.find('.quote')).to have_content(/away from home/i)
    end
end #end of test
