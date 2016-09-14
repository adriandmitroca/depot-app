require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "two different products can be added to the cart" do
    cart = Cart.new
    cart.add_product(products(:ruby).id)
    cart.add_product(products(:php).id)

    assert_equal 2, cart.line_items.size
    assert_equal 89.49, cart.total_price
  end
end
