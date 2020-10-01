class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.integer :user_id
      t.integer :request_id
      t.string :status

      t.timestamps
    end
  end
end
