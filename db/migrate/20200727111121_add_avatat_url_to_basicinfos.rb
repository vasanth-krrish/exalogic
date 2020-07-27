class AddAvatatUrlToBasicinfos < ActiveRecord::Migration[6.0]
  def change
    add_column :basicinfos, :avatar_url, :string
  end
end
