class Atendence < ApplicationRecord
  belongs_to :atendee, class_name: 'User', foreign_key: :atendee_id
  belongs_to :attended_event, class_name: 'Event', foreign_key: :attended_event_id
end
