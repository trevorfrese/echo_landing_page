class AddParentPostIdAndChildPostIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :parent_post_id, :integer
    add_column :posts, :child_post_id, :integer
  end
end
