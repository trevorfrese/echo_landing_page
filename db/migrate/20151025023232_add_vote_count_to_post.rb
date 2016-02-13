class AddVoteCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :votes_count, :integer, default: 0
  end
end
