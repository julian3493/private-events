require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'check the user name' do
    it 'if name is valid' do
      user = User.new
      user.name = 'user name'
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blank")
    end

    it 'if name is empty' do
      user = User.new
      user.name = ''
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'if name is too short' do
      user = User.new
      user.name = 'na'
      user.valid?
      expect(user.errors[:name]).to include('is too short (minimum is 3 characters)')
    end
  end
end
