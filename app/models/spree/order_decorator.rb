module Spree
  module OrderDecorator
    def payment_state_readable
      return 'refunded' if self.refunds.any?
      payment_state
    end
  end
end

Spree::Order.prepend Spree::OrderDecorator