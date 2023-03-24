require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'Validations' do
    user = User.create(name: 'Anna', email: 'anna@gmail.com', password: '123456')
    category = Category.create(name: 'Cakes', user_id: user.id)
    payment = Payment.new(name: 'Cup cakeake', amount: 100.0, user_id: user.id, category_id: category.id)

    it 'name should be present' do
      payment.name = nil
      expect(payment).to_not be_valid
    end

    it 'amount should be present' do
      payment.amount = nil
      expect(payment).to_not be_valid
    end

    it 'aleast one category should be present' do
      user.categories = []
      expect(payment).to_not be_valid
    end

    it 'payment user should be present' do
      payment.user = nil
      expect(payment).to_not be_valid
    end
  end
end
