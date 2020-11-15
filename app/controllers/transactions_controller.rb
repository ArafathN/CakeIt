class TransactionsController < ApplicationController
    def create
        cake = Cake.find_by!(slug:params[:slug])
        token = params[:stripeToken]

        begin
            charge = Stripe::Charge.creat(
                amount: cake.price,
                currency: "eur",
                card: token,
                description: current_user.email)

        @sale = cake.sales.create!(buyer_email:current_user.email)
            redirect_to pickup_url(uuid:@sale.uuid)


        rescue Stripe::CardError => e
            flash[:notice] = e.message
            redirect_to cake_path(cake)
    end

    def pickup
        @sale = Sale.find_by!(uuid:params[:uuid])
        @cake = @sale.cake
    end
end
