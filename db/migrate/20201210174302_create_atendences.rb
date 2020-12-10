class CreateAtendences < ActiveRecord::Migration[6.0]
  def change
    create_table :atendences do |t|
      t.integer :atendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
