class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :owner_id
      t.string :title
      t.string :description
      t.rename :type, :request_type
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
