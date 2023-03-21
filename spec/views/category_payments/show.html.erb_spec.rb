require 'rails_helper'

RSpec.describe 'category_payments/show', type: :view do
  before(:each) do
    assign(:category_payment, CategoryPayment.create!(
                                category: nil,
                                payment: nil
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
