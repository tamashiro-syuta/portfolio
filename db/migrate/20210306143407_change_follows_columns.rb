class ChangeFollowsColumns < ActiveRecord::Migration[5.2]
  def change

    add_column :follows, :following, :string
    add_column :follows, :followed, :string
    remove_column :follows, :user_id, :string
    remove_column :follows, :user_id, :string

  end
end
