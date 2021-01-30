require 'spec_helper'

describe SpreeAdminOnepageOrder::Carriers do
  it "find searches by string for a carrier and finds USPS" do
    expect(SpreeAdminOnepageOrder::Carriers.find('usps')).to eq(SpreeAdminOnepageOrder::USPS)
    expect(SpreeAdminOnepageOrder::Carriers.find('USPS')).to eq(SpreeAdminOnepageOrder::USPS)
  end
end