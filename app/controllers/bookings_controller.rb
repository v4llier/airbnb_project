class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = @flat.bookings.build(booking_params)
    @user = current_user
    # @user = User.first # for testing !!

    if !@user

    redirect_to flat_path(@flat), alert: 'Booking failed. Please first login to book a hut.'
    # can't save and is redirected if not logged
      return
    end

    @booking.user_id = @user.id

    if @booking.save
      redirect_to flat_booking_path(@flat, @booking)
    else
      redirect_to flat_path(@flat), alert: 'Something wrong in your controller ;-)'
    end
  end


  def edit
  end

  def update

    # TO REMOVE JASON STUFF
  end

  def show

  end

  private

  def set_booking
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment, :rating, :guests)
  end
end
