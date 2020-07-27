class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :department
      t.string :designation
      t.integer :user_id

      t.timestamps
    end
  end
end
