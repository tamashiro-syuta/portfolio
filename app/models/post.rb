class Post < ApplicationRecord
    has_many :photos, dependent: :destroy
end
