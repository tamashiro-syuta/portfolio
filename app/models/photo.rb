class Photo < ApplicationRecord
    belongs_to :post

    # Photoモデルのimageカラムと、先ほど作成したアップローダーImageUploaderの紐付け
    mount_uploader :image, ImageUploader

end
