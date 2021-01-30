module Spree
  module Admin
    module OrdersControllerDecorator
      def show
        load_order

        @order.refresh_shipment_rates(ShippingMethod::DISPLAY_ON_BACK_END) unless @order.completed?
      end
    end
  end
end


Spree::Admin::OrdersController.prepend Spree::Admin::OrdersControllerDecorator