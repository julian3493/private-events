require 'rails_helper'

RSpec.describe 'Event', type: :feature do
  describe 'check if a user is logged in to create an event' do
    it 'allows to create an event if user is logged in' do
      User.create(name: 'User')
      visit new_session_path
      fill_in 'name', with: 'User'
      find("input[type='submit']").click
      find("a[href='/events/new'").click
      expect(page).to have_content('New Event')
    end

    it 'does not allow to create an event if user is not logged in' do
      visit new_event_path
      expect(page).to have_content('You must be logged in to perform that action')
    end
  end
end
