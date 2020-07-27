class Addindextobasicinfo < ActiveRecord::Migration[6.0]
  def change
    add_index :basicinfos, :user_id, unique: :true
  end
end
