class Blog < ActiveRecord::Base
belongs_to :user
validates :title, :content, :presence =>true
  validates :title, :length => {:minimum => 2}
validates_uniqueness_of :title, scope: :user_id
has_many :comments




end
