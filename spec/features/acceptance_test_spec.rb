require 'rails_helper'


def create_book
  Book.create!(
    title: 'Test Book',
    author: 'John Doe',
  )
end
def create_user
  User.create!(
    name: 'Joe',
    email: 'Joe@joe.com',
    password: '1234567890'
  )
end

feature "Welcome Page" do
  scenario "visit the welcome page" do
    visit root_path

    expect(page.find('.quote')).to have_content(/away from home/i)
  end

  scenario "browse button will take your to the browse libraries page" do
    visit root_path
    click_on 'Browse Libraries'

    expect(current_path).to eq(browse_index_path)
  end

  scenario "Sign Up button will take your to the sign up page" do
    visit root_path
    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)
  end

  scenario "Log In button will take your to the log in page" do
    visit root_path
    click_on 'Log In'

    expect(current_path).to eq(new_session_path)
  end

end #end of 'Welcome Page' test

# feature "Browse Libraries Page" do
#   scenario "display all book in database" do
#     visit browse_index_path
#     expect(page.find('.title')).to have_content
#     expect(page.find('.author')).to have_content
#   end

  # scenario "To click the search button and be lead to a new page" do
  # end
  
# end #end "Browse Libraries Page"

feature "Log In Page" do
  # scenario "User will log in and be lead to user's profile page" do
  #   create_user
  #   visit root_path
  #   click_on 'Log In'
  #   fill_in 'Email', with: 'Joe'
  #   fill_in 'Password', with: '1234567890'
  #   click_on 'Welcome Back!'

  #   expect(current_path).to have_content(/Welcome/i)
  # end
end #end "Log In Page"


