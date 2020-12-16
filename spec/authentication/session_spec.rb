require 'rails_helper'

RSpec.describe 'Session', type: :feature do
  describe 'check if login is valid' do
    it 'create a session if user exists' do
      User.create(name: 'User')
      visit new_session_path
      fill_in 'name', with: 'User'
      find("input[type='submit']").click
      expect(page).to have_content('Logged in!')
    end

    it 'not create a session if user does not exist' do
      User.create(name: 'User')
      visit new_session_path
      fill_in 'name', with: 'noUser'
      find("input[type='submit']").click
      expect(page).to have_content('Invalid user name')
    end
  end
end
