class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 6, maximum: 50 }
  validates :date, presence: :true
  validates :location, presence: :true

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  has_many :atendences, class_name: :Atendence, foreign_key: :attended_event_id, dependent: :destroy
  has_many :atendees, through: :atendences

  scope :upcoming, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date < ? ', DateTime.now) }
end
