module RatingAverage
  def average_rating
    "Has #{ratings.count} " "#{'rating'.pluralize(ratings.count)}" ", average #{ratings.average('score')}"
  end
end