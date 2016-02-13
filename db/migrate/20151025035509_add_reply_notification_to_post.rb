class AddReplyNotificationToPost < ActiveRecord::Migration
  def change
    add_column :posts, :new_replies, :integer, default: 0
  end
end
