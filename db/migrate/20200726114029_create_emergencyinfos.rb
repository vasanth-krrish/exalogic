class CreateEmergencyinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :emergencyinfos do |t|
      t.string :name
      t.string :relation
      t.string :contact
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode

      t.timestamps
    end
  end
end
