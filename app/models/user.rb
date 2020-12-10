class User < ApplicationRecord
  has_many :events, class_name: :Event, foreign_key: :creator_id
  has_many :atendences, class_name: :Atendence, foreign_key: :atendee_id

  has_many :attended_events, through: :atendences
end
