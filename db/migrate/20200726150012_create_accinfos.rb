class CreateAccinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :accinfos do |t|
      t.string :accno
      t.string :bank
      t.string :branch
      t.string :ifsc
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
