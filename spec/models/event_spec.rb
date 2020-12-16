require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'check name of the event is not empty' do
    it 'if name exist' do
      event = Event.new
      event.name = 'event name'
      event.valid?
      expect(event.errors[:name]).to_not include("can't be blank")
    end

    it 'if name is empty' do
      event = Event.new
      event.name = ''
      event.valid?
      expect(event.errors[:name]).to include("can't be blank")
    end
  end

  describe 'check if the event has date' do
    it 'if date is not present' do
      event = Event.new
      event.date = ''
      event.valid?
      expect(event.errors[:date]).to include("can't be blank")
    end

    it 'if date is present' do
      event = Event.new
      event.date = '2020-12-31 00:00:00'
      event.valid?
      expect(event.errors[:date]).to_not include("can't be blank")
    end

    it 'if date is not valid' do
      event = Event.new
      event.date = 'notdate'
      event.valid?
      expect(event.errors[:date]).to include("can't be blank")
    end
  end

  describe 'check if location of the event is not empty' do
    it 'if location exist' do
      event = Event.new
      event.location = 'event name'
      event.valid?
      expect(event.errors[:location]).to_not include("can't be blank")
    end

    it 'if location is empty' do
      event = Event.new
      event.location = ''
      event.valid?
      expect(event.errors[:location]).to include("can't be blank")
    end
  end
end
