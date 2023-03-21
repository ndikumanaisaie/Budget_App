require 'rails_helper'

RSpec.describe "category_payments/new", type: :view do
  before(:each) do
    assign(:category_payment, CategoryPayment.new(
      category: nil,
      payment: nil
    ))
  end

  it "renders new category_payment form" do
    render

    assert_select "form[action=?][method=?]", category_payments_path, "post" do

      assert_select "input[name=?]", "category_payment[category_id]"

      assert_select "input[name=?]", "category_payment[payment_id]"
    end
  end
end
