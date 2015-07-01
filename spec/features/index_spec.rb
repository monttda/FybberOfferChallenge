require 'rails_helper'


describe "Fetching offers", :type => :feature , js: true do
  context 'When given erroneous params' do
    it "should render an error message" do
      expected_text = "There has been an error please verify that You have submitted valid parameters to the search and retry"
      visit root_path
      click_on('Search')
      within("#offers") do
        expect(page).to have_text(expected_text)
      end
    end
  end

  context 'When given good params' do
    it "should render an the offers or a message that there are no offers" do
      visit root_path
      fill_in('uid', :with => 'player1')
      fill_in('page', :with => '1')
      click_on('Search')
      within("#offers") do
        expect(page).to have_css('.thumbnail', minimum: 1)
      end
    end
  end
end
