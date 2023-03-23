require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { User.create(name: 'user', email: 'example@mail.com', password: 'password') }
  let(:category) { Category.create(name: 'food', icon: 'icon.png', user_id: user.id) }
 

  subject do
    described_class.new(name: 'name', amount: 20, user_id: user.id,
                        category_id: category.id)
  end

  describe 'Validations' do
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end
end
