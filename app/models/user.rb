class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tweets
  before_save {self.email = email.downcase}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #A follower is a user than follows another user.
  has_many :follower_followships,
    class_name: "Followship",
    foreign_key: "follower_id",
    dependent: :destroy

  # To see the users that the user follows, we reference them through the join
  # table.
  has_many :followees, through: :follower_followships

  # A followee is a user that is followed by another user.
  has_many :followee_followships,
    class_name: "Followship",
    foreign_key: "followee_id",
    dependent: :destroy

  # To see the users that follow a user, we reference them through the join
  # table.
  has_many :followers, through: :followee_followships


  def follow(user)
    followees << user
  end

  def unfollow(followed_user)
    followees.delete followed_user
  end

  def following?(other_user)
    followees.include?(other_user)
  end

  VALID_USERNAME_REGEX = /^[a-zA-Z\d\.\-\/# ]+$/ 
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3 , maximum: 18 }, format: {with: VALID_USERNAME_REGEX, multiline: true}


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: {case_sensitive: false }, format: { with: VALID_EMAIL_REGEX} 


end
