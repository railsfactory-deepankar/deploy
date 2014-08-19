class User < ActiveRecord::Base
has_many :blogs

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_attached_file :avatar
validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
#validates :user_name, :gender, :presence =>true
#validates_uniqueness_of :user_name
end
