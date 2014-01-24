class Beer < ActiveRecord::Base
  include RatingAverage
  has_many :ratings, :dependent => :destroy
  belongs_to :brewery

  def to_s
    "#{self.name}" " by #{brewery.name}"
  end
end