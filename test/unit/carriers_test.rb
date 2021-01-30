require 'spree_core'
require 'spree_extension'
require 'spree_admin_onepage_order'

class CarriersTest < ActiveSupport::TestCase
  test ".find searches by string for a carrier and finds USPS" do
    assert_equal SpreeAdminOnepageOrder::USPS, SpreeAdminOnepageOrder::Carriers.find('usps')
    assert_equal SpreeAdminOnepageOrder::USPS, SpreeAdminOnepageOrder::Carriers.find('USPS')
  end

  test ".find searches by symbol for a carrier and finds USPS" do
    assert_equal SpreeAdminOnepageOrder::USPS, SpreeAdminOnepageOrder::Carriers.find(:usps)
  end

  test ".find raises with an unknown carrier" do
    assert_raises(NameError) { SpreeAdminOnepageOrder::Carriers.find(:polar_north) }
  end
end