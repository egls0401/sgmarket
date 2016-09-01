class AddAvatarsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :avatars, :json
  end
end
