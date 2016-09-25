require 'test_helper'

class OrderNotifierMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifierMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_match /depot@example.com/, mail.from
    assert_match /<td>MyString<\/td>/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifierMailer.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_match /depot@example.com/, mail.from
    assert_match /<td>MyString<\/td>/, mail.body.encoded
  end

end
