class Admin::BookingsController < ApplicationController
  before_action :redirect_unless_admin!

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = Booking.all.paginate(:page => params[:page]).order('id DESC')
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    binding.pry
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.status = "Booked"
    if @booking.save
      flash[:success] = "seat added!"
      redirect_to bookings_path
    else
      render :new
     end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
     @booking = Booking.find(params[:id])
     if @booking.update(booking_params)
      flash[:success] = "Desk updated!"
      redirect_to bookings_path
    else
      render :edit
     end
  end


  def thank_you
    @tour = Booking.find(params[:tour_id])
    @booking = Booking.last
  end

  def cancel_booking
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      @booking.status = "Canceled"
      flash[:success] = "Desk updated!"
      redirect_to bookings_path
    else
      render :edit
     end
  end

  private

  def booking_params
    params.require(:booking).permit(:seat, :start_date, :expiration_date)
  end
end
