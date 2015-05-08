module ReviewsHelper
  def star_rating(rating)
    # does the rating respond to `round`? If not, just return the rating
    return rating unless rating.respond_to?(:round)

    remainder = (5 - rating)
    '★' * rating.round + '☆' * remainder
  end
end
