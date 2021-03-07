class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :content
      t.date :date
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
