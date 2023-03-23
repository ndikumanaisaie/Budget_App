class Payment < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :category_payments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 100_000_000 }
  validates :user_id, presence: true
end
