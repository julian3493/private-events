require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'check if user name is valid' do
    it 'save a new user if user name is valid' do
      visit new_user_path
      fill_in 'user_name', with: 'User'
      find("input[type='submit']").click
      expect(page).to have_content('User was successfully created.')
    end

    it 'do not save a new user if user name is invalid' do
      visit new_user_path
      fill_in 'user_name', with: 'na'
      find("input[type='submit']").click
      expect(page).to have_content('User invalid')
    end

    it 'do not save a new user if user is already created' do
      User.create(name: 'user')
      visit new_user_path
      fill_in 'user_name', with: 'user'
      find("input[type='submit']").click
      expect(page).to have_content('User invalid')
    end
  end
end
