class ChangePostImages < ActiveRecord::Migration[5.2]
  def change
    change_column :post_images, :post, :integer
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
