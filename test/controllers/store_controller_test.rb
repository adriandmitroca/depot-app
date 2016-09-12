require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 2.3'
    assert_select '.price', /PLN [,\d]+\.\d\d/
  end

  test "should see the counter after 6 visits" do
    6.times { get store_index_url }

    assert_select '#counter', 'Hey, you have viewed our catalog 6 times. Do you need any help?'
  end
end
