class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags, :id => false do |t|
      t.references :post, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
