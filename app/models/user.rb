class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, uniqueness: true
  validates :first_name, :last_name, :user_name, presence: true
  has_many :posts

  has_attached_file(
    :profile_image,
    styles: { medium: '250x250#', thumb: '100x100#' },
  )

  validates_attachment_content_type(
    :profile_image,
    content_type: %r{\Aimage\/.*\z},
    with: %r{^balls/.+\.(gif|jpe?g|png|svg)$}i,
    message: ' and have an image extension'
  )
  has_many :friendships
  # has_many :friendships, dependent: :destroy
  # has_many :friends, through: :friendships, source: :friend
	has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

	has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
	has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
	has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

# to call all your friends

	def friends
	  active_friends | received_friends
	end

# to call your pending sent or received

	def pending
		pending_friends | requested_friendships
	end
end
