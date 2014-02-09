class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  validates :username, uniqueness: true,
                       length: {minimum: 3, maximum: 15}
  validates :password, length: {minimum: 4}
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships


validate :has_one_uppercase_letter
validate :has_one_number

 def to_s
   username
 end

  def has_one_uppercase_letter
    errors.add(:password, "must have one uppercase letter") unless password =~ /[A-Z]/
  end
  def has_one_number
    errors.add(:password, "must have one number") unless password =~ /[0-9]/
  end
  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end

  end