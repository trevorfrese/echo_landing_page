class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :upvoted_users, through: :votes, source: :user
  has_many :posts

  before_destroy :destroy_child_posts

  default_scope -> { order(votes_count: :desc,created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :parent_post_id, presence: true


  protected

  def destroy_child_posts
    Post.all.select{|p| p.parent_post_id == id}.each{|post| post.destroy}
  end
end
