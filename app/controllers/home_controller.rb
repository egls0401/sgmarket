class HomeController < ApplicationController
  before_action :require_login, except: [:index]
  
  def index
      @posts=Post.all.page(params[:page]).per(12).order("created_at DESC")
  end
  
  def delete
    @del_post = Post.find(params[:post_id])
    resource = User.find_for_database_authentication(id: current_user.id)
    if resource.valid_password?(params[:delete_password])
      @del_post.destroy
      redirect_to "/home/index"
    elsif current_user.admin?
      @del_post.destroy
      redirect_to "/home/index"  
    else
      redirect_to :back
    end
  
  end
  
  def password_delete
   @will_deleted = Post.find(params[:post_id])
  end
  
  def delete_reply
    @del_reply = Reply.find(params[:reply_id])
    @del_reply.delete
    
    redirect_to :back
  end
  
  def update_view
    @upd_post = Post.find(params[:post_id])
    resource = User.find_for_database_authentication(id: current_user.id)
    unless resource.valid_password?(params[:edit_password])
      redirect_to "/home/index"
    end
  end

  def password_edit
    @will_edit = Post.find(params[:post_id])
  end
 
  def do_update
    
    @do_upd_post = Post.find(params[:post_id])
    
    @do_upd_post.title = params[:title]
    @do_upd_post.content = params[:content]
    @do_upd_post.contact = params[:contact]
    @do_upd_post.price = params[:price]
    @do_upd_post.user_id = current_user.id
  
    unless params[:avatars].nil?
    @do_upd_post.post_images.clear
    params[:avatars].each do |file|
        PostImage.create!(post_id: @do_upd_post.id, avatar: file)
      end
    end
    
    @do_upd_post.tags=[]
    tag = Tag.find_or_create_by(name: params[:category])
    Hashtag.create(post_id: @do_upd_post.id, tag_id: tag.id)
    
    tag = Tag.find_or_create_by(name: params[:hashtag1])
    Hashtag.create(post_id: @do_upd_post.id, tag_id: tag.id)
    
    tag = Tag.find_or_create_by(name: params[:hashtag2])
    Hashtag.create(post_id: @do_upd_post.id, tag_id: tag.id)
  
    tag = Tag.find_or_create_by(name: params[:hashtag3])
    Hashtag.create(post_id: @do_upd_post.id, tag_id: tag.id)
    @do_upd_post.save
    
    redirect_to "/view_each/#{@do_upd_post.id}"
  end
  
  def complete
    
    @new_post = Post.new
    
   # @new_post.avatars= params.permit({:avatars => []})

   # uploader = MktimageUploader.new
   # uploader.store!(file)
   # @new_post.image_url = uploader.url
    
    @new_post.title = params[:title]
    @new_post.content = params[:content]
    @new_post.contact = params[:contact]
    @new_post.user_id = current_user.id
    @new_post.price = params[:price]
    @new_post.save
    
    # create post_image
    if params[:avatars].nil?
      @new_post.image_url = ActionController::Base.helpers.asset_path("emptyimage.png")
      @new_post.save
    else
      params[:avatars].each do |file|
        PostImage.create!(post_id: @new_post.id, avatar: file)
      end
    end
    
    tag = Tag.find_or_create_by(name: params[:category])
    Hashtag.create(post_id: @new_post.id, tag_id: tag.id)
    
    tag = Tag.find_or_create_by(name: params[:hashtag1])
    Hashtag.create(post_id: @new_post.id, tag_id: tag.id)
    
    tag = Tag.find_or_create_by(name: params[:hashtag2])
    Hashtag.create(post_id: @new_post.id, tag_id: tag.id)
  
    tag = Tag.find_or_create_by(name: params[:hashtag3])
    Hashtag.create(post_id: @new_post.id, tag_id: tag.id)
    
    if params[:title].blank?
      redirect_to :back
    else
     redirect_to "/home/index"
    end
  end
 
  def view_each
    @one_post = Post.find(params[:post_id])
    if user_signed_in? && current_user==@one_post.user
      if @one_post.replies.count == 0
        @one_post.replycount=0
      else
        @one_post.replycount=@one_post.replies.last.id
      end
      @one_post.save
    end
  end
  
  def reply_write
    @new_reply = Reply.new
    @new_reply.content = params[:comment]
    @new_reply.post_id = params[:id_of_post]
    @new_reply.user_id = current_user.id
    @new_reply.save
    
    redirect_to :back
  end
  

  def myinfo
  end
  
  def show_user_post
    @myposts= current_user.posts.all.page(params[:page]).per(12).order("created_at DESC")
  end
  
  def show_reply_post
  
    @myreply=current_user.replies
    array = [] 
    @myreply.each do |r| 
      array << r.post_id 
    end 
    @array=array.uniq
  
  end
  

  def tags
    tag = Tag.find_by(name: params[:name])
    unless tag.nil?
    @posts = tag.posts.all.page(params[:page]).per(12).order("created_at DESC")
    end
  end
  
  
  def finish_post
    @fin_post=Post.find(params[:post_id])
    
    resource = User.find_for_database_authentication(id: current_user.id)
    if resource.valid_password?(params[:edit_password])
      @fin_post.finished=1
      @fin_post.image_url=ActionController::Base.helpers.asset_path("finished_pic.png")
      @fin_post.save
      redirect_to "/home/index"
    else
      redirect_to :back
    end
   
    
   
  end
  
  def password_finish
     @will_finish = Post.find(params[:post_id])
  end
  def writer_post
    @nowpost=Post.find(params[:post_id])
    @writerpost=@nowpost.user.posts.all.page(params[:page]).per(12).order("created_at DESC")
  end
  
  def search
    if params[:search]
       @search = Post.search(params[:search]).all.page(params[:page]).per(12).order("created_at DESC")
    end
  end
   
  def change_pic
    
    @picture=["angel", "blushed","crushed","happy","hugging","kissing","money","nerdy","smile","sunglass","wink","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    @change_userpic=User.find_by(id: params[:user_id])
    @change_userpic.userpic=@picture.sample
    @change_userpic.save
    
    redirect_to :back
  end
end