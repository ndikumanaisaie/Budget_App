require 'rails_helper'

RSpec.describe "category_payments/edit", type: :view do
  let(:category_payment) {
    CategoryPayment.create!(
      category: nil,
      payment: nil
    )
  }

  before(:each) do
    assign(:category_payment, category_payment)
  end

  it "renders the edit category_payment form" do
    render

    assert_select "form[action=?][method=?]", category_payment_path(category_payment), "post" do

      assert_select "input[name=?]", "category_payment[category_id]"

      assert_select "input[name=?]", "category_payment[payment_id]"
    end
  end
end
