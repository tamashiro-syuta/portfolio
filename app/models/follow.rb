class Follow < ApplicationRecord
    validates :following, {presence: true}
    validates :followed, {presence: true}
end