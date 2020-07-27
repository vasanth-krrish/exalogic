class CreateBasicinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :basicinfos do |t|
      t.date :dob
      t.date :doj
      t.string :empid
      t.string :bloodtype
      t.string :contact
      t.string :gender
      t.text :address
      t.string :state
      t.string :city
      t.string :country
      t.string :pincode
      t.string :user_id

      t.timestamps
    end
  end
end
