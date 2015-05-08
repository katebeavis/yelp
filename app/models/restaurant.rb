class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 3 }, uniqueness: true
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: 'https://s3-eu-west-1.amazonaws.com/kaprianofox/nophoto2.png',
                            s3_host_name: 's3-eu-west-1.amazonaws.com',
                            path: ':filename'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def build_review(user, params)
    review = reviews.build(params)
    review.user = user
    review
  end

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
