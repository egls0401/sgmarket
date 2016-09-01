class Post < ActiveRecord::Base
    
    include SearchCop
      search_scope :search do
        attributes :title, :content
      end
      
    belongs_to :user
    # connect with image model
    has_many :post_images
    has_many :replies
    has_many :hashtags
    has_many :tags, through: :hashtags
    # mount_uploader :avatars, MktimageUploader
end
