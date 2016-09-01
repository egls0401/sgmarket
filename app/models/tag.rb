class Tag < ActiveRecord::Base
    has_many :hashtags
    has_many :posts, through: :hashtags
end
