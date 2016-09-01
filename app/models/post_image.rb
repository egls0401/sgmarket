class PostImage < ActiveRecord::Base
    # connect with post model
    belongs_to :post
    # set image
    mount_uploader :avatar, MktimageUploader
end
