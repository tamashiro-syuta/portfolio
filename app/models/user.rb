class User < ApplicationRecord
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :prof_image, {presence: true}

    has_secure_password

end
