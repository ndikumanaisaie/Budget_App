class Payment < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :category_payment
end
