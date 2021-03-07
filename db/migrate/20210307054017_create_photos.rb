class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|

      t.string :image, null: false
      t.references :post, foreign_key: true, null: false # postテーブルに紐付け
      # ==========ここまで追加する==========
      # t.references :good, foreign_key: true, null: falseのgoodは
      # 紐付けたいテーブル名です。私の場合は商品に紐付けたかったのでGoodテーブルに紐づけております。
      # 人によってはテーブル名が異なるかと存じます。

      t.timestamps
    end
  end
end
