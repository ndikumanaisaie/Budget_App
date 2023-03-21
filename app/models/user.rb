class User < ApplicationRecord
  has_many :category
  has_many :payments, dependent: :destroy
  has_many :categories, dependent: :destroy

  has_one_attached :profile_picture, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }

  def most_recent_categories
    categories.order(created_at: :desc).limit(3)
  end
end
