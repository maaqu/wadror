class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers

  validates :name, presence: true
  validates :year, numericality: { less_than_or_equal_to: ->(_) { Time.now.year} }

  def to_s
    "#{self.name}"
  end

end
