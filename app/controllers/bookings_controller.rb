class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_booking, only: [:show, :edit, :update, :edit_cancel]
  before_action :authenticate_user!

  def show; end

  def index
    @bookings = Booking.all.paginate(:page => params[:page]).order('id DESC')
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.status = "active"
    if @booking.save
      flash[:success] = "Desk added!"
      redirect_to bookings_path
    else
      render :new
     end
  end

  def edit; end

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
    @tour = Booking.find(params[:booking_id])
    @booking = Booking.last
  end

  def set_booking
   @booking = Booking.find(params[:id])
  end

  def edit_cancel; end

  def cancel
    binding.pry
    @booking = Booking.find(params[:booking][:id])
    @booking.cancellation_reason = params[:booking][:cancellation_reason]
    @booking.cancellation_comment =params[:booking][:cancellation_comment]
    @booking.status = "Canceled"
    if @booking.save(:validate => false)
      flash[:success] = "Desk cancelled!"
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
