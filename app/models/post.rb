class Post < ApplicationRecord
    has_many :images, dependent: :destroy

    # @user.post とやるとそのユーザーの投稿を全て取得
    def posts
        return Post.where(user_id: self.id)
    end

end
