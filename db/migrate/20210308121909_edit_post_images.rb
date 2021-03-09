class EditPostImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :post_id, :integer
    remove_column :post_images, :image_id, :integer

    add_column :post_images, :save_to, :string
    add_column :post_images, :post, :string
  end
end
