class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  has_many :atendences, class_name: :Atendence, foreign_key: :attended_event_id, dependent: :destroy
  has_many :atendees, through: :atendences
end
