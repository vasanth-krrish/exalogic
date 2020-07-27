class AddUserIdToEmergencyinfos < ActiveRecord::Migration[6.0]
  def change
    add_column :emergencyinfos, :user_id, :integer
  end
end
