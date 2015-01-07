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

feature "Welcome Page, user can..." do
  
  scenario "visit the welcome page" do
    visit root_path
    expect(current_path).to eq('/')
  end

  scenario "Sign Up button will take your to the sign up page" do
    visit root_path
    find_link('Sign Up').visible?
    click_on 'Sign Up'
    expect(current_path).to eq(new_user_path)
  end

  scenario "Log In button will take your to the log in page" do
    visit root_path
    find_link('Log In').visible?
    click_on 'Log In'
    expect(current_path).to eq(new_session_path)
  end

  scenario "browse button will take your to the browse libraries page" do
    visit root_path
    find_link('Browse Libraries').visible?
    click_on 'Browse Libraries'
    expect(current_path).to eq(browse_index_path)
  end

  scenario "Goodread link will lead user to Goodreads' home page" do
    visit root_path
    find_link('goodreads').visible?
    click_on 'goodreads'
    expect(current_url).to eq('https://www.goodreads.com/')
  end

end #end of 'Welcome Page' test


feature "Browse Libraries Page" do
  
  scenario "browse button on home page will take you to the browse libraries page" do
    visit root_path
    find_link('Browse Libraries').visible?
    click_on 'Browse Libraries'
    expect(current_path).to eq(browse_index_path)
  end

  scenario "user clicks on Welcome Page link" do
    visit browse_index_path
    find_link('Welcome Page').visible? 
    click_on 'Welcome Page'
    expect(current_path).to eq(root_path)
  end

  scenario "search button" do
    visit browse_index_path
    find('.search').visible?
  end

  # scenario "display all book in database" do
  #   visit browse_index_path
  #   expect(page).to have_css('title')
  # end

  # scenario "To click the search button and be lead to a new page" do
  # end
  
end #end "Browse Libraries Page"












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


