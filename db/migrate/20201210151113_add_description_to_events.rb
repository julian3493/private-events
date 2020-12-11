class AddDescriptionToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :description, :string, after: 'name'
  end
end
