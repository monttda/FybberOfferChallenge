require 'rails_helper'


RSpec.describe "Fetching offers", :type => :feature do
  context 'When given erroneous params' do
    it "should render an error message" do
      visit '/'
      click_on('Search')
      within("#offers") do
        expect(page).to have_text(t('request.400'))
      end
    end
  end

  context 'When given good params' do
    it "should render an the offers or a message that there are no offers" do
      visit '/'
      fill_in('uid', :with => 'player1')
      click_on('Search')
      within("#offers") do
        expect(page).to have_css('.thumbnail', minimum: 1)
      end
    end
  end
end
