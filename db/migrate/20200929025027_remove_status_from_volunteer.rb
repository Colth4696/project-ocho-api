class RemoveStatusFromVolunteer < ActiveRecord::Migration[6.0]
  def change
    remove_column :volunteers, :status, :string
  end
end
