require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def create_cart_with_one_product
    cart=Cart.create
    cart.line_items.create(product_id: 1)
    cart
  end

  test "cart should create a new line item when adding a new product" do
    cart=create_cart_with_one_product
    line_item=cart.add_product(2)
    line_item.save
    assert_equal cart.line_items.first.quantity, 1
    assert_equal cart.line_items.last.quantity, 1
  end

  test "cart should update an existing line item when adding an existing product" do
    cart=create_cart_with_one_product
    line_item=cart.add_product(1)
    line_item.save
    assert_equal cart.line_items.first.quantity, 2
  end

end
