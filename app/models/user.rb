class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 15}

  validates :password, length: { in: 8..32 }
  validates :password, format: { with: /\A[a-z0-9]+\z/ }

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end
