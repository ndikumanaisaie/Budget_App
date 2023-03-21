class User < ApplicationRecord
  has_many :category
  has_many :payment
  has_many :category_payment through Payment
end
