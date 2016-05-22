require "rails_helper"

feature "Create page" do
  let(:user) { create :user }

  def sign_in(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  scenario "User creates page with valid data" do

  	sign_in(user.email, user.password)

  	visit new_page_path

  	fill_in "Title", with: 'New page'
  	fill_in "Body", with: 'New page content'

  	click_button "Create Page"

  	el = page.find(".top-bar")

  	expect(el).to have_link "New page"
  	expect(Page.count).to eq(1)
  end

  scenario "User creates page with invalid data" do

  	sign_in(user.email, user.password)

  	visit new_page_path

  	fill_in "Body", with: 'New page content'

  	click_button "Create Page"
  	
  	expect(page).to have_content "can't be blank"
  	expect(Page.count).to eq(0)
  end
end