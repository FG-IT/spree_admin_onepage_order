module SpreeAdminOnepageOrder
  module Carriers
    extend self

    attr_reader :registered
    @registered = []

    def register(class_name, autoload_require)
      SpreeAdminOnepageOrder.autoload(class_name, autoload_require)
      self.registered << class_name
    end

    def all
      SpreeAdminOnepageOrder::Carriers.registered.map { |name| SpreeAdminOnepageOrder.const_get(name) }
    end

    def find(name)
      if name.downcase.include? 'ups'
        name = 'UPS'
      end
      all.find { |c| c.code.downcase == name.to_s.downcase } or raise NameError, "unknown carrier #{name}"
    end
  end
end

SpreeAdminOnepageOrder::Carriers.register :USPS, 'shipping/carriers/usps'
SpreeAdminOnepageOrder::Carriers.register :FedEx, 'shipping/carriers/fedex'
SpreeAdminOnepageOrder::Carriers.register :UPS, 'shipping/carriers/ups'
SpreeAdminOnepageOrder::Carriers.register :DHL, 'shipping/carriers/dhl'
SpreeAdminOnepageOrder::Carriers.register :DHL_Global_Mail, 'shipping/carriers/dhl_global_mail'
