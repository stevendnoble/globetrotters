class User < ActiveRecord::Base

	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  # validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, length: { minimum: 8 }

	belongs_to :city
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end

