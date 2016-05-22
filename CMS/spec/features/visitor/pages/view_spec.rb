require "rails_helper"

feature "View page" do
  let!(:site_page) { create :page }

	scenario "view page" do
	  visit root_path
	  expect(page).to have_content(site_page.title)
	end

	scenario "view page content" do
	  visit root_path
	  click_link site_page.title

	  expect(page).to have_content(site_page.body)
	end
end
