class Category < ApplicationRecord
  belongs_to :user
  has_many :category_payments
  has_many :payments

  has_one_attached :icon, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
end
