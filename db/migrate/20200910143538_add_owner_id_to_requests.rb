class AddOwnerIdToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :owner_id, :integer
  end
end
