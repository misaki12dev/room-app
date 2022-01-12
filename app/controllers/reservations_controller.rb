class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all
    @room = Room.find_by(params[:id])

  end

  def new
    @reservation = Reservation.new(reservation_params)
    # @room = Room.find(params[:id])

    # binding.pry
    # @reservation.room_id = Room.find(params[:id])

  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save

      # binding.pry

      redirect_to reservation_path(@reservation.id)
    else
      render "new"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private
  def reservation_params
    # params.require(:reservation).permit(:start_date, :end_date, :number_of_people).merge(room_id: params[:room_id], user_id: current_user.id)
    params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id)
  end

end
