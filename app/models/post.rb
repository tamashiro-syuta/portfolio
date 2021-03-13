class Post < ApplicationRecord
    has_many_attached :images

    # @user.post とやるとそのユーザーの投稿を全て取得
    def posts
        return Post.where(user_id: self.id)
    end

    # 画像のリサイズ（使う際には　画像.thumbnail　の形）
    def thumbnail
        return self.image.variant(resize: '300x300').processed
      end      

end
