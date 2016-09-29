class ReservationsController < ApplicationController

	def create

		# start_date = params[:reservation][:start_date].to_date
		# end_date =params[:reservation][:end_date].to_date

		params[:reservation][:start_date] = Date.strptime(params[:reservation][:start_date], '%m/%d/%Y') 
		params[:reservation][:end_date] = Date.strptime(params[:reservation][:end_date], '%m/%d/%Y')
		params[:reservation][:listing_id] = params[:listing_id]

		# params[:reservation][:guest_number] = params[:reservation][:guest_number].to_i

		# params[:reservation][:total_price] = total_price
		# byebug
		reservation = current_user.reservations.new(reservation_params)

		if reservation.save
			redirect_to "/users/#{current_user.id}/reservations"
    	else
    		flash[:danger] = reservation.errors.full_messages
			redirect_to "/listings/#{params[:listing_id]}"
    	end

	end


	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date, :user_id, :listing_id, :guest_number, :total_price)
	end
end
