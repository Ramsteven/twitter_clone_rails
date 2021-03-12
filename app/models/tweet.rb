class Tweet <  ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: {minimum: 5, maximum: 280}
end
