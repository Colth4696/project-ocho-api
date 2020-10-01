class ChangeRequests < ActiveRecord::Migration[6.0]
  def change
    change_column :requests, :latitude, :decimal
    change_column :requests, :longitude, :decimal
  end
end
