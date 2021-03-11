class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :post_images
    drop_table :photos
  end
end
