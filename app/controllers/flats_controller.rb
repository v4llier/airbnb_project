class FlatsController < ApplicationController

  before_action :set_flat, only: [:show, :update, :destroy, :edit]

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    respond_to do |format|
      if @flat.save
        format.html { redirect_to new_flat_image_path(@flat), notice: 'Hut was successfully created.' }
        format.json { render :show, status: :created, location: @flat }
      else
        format.html { render :new }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def index
    @flats = Flat.all
  end

  def show
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @alert_message = "You are viewing #{@flat.title}"
    @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
    @guests = params[:guests] ? params[:guests].gsub(/[^0-9]/, '').to_i : 1
    @booking = Booking.new(start_date: @start_date, end_date: @end_date, guests: @guests)
  end

  def destroy
    @user = @flat.user_id
    @flat.destroy

    redirect_to user_path(@user), notice: 'Hut was successfully deleted.'
  end

  def update
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to @flat, notice: 'Hut was successfully updated.' }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    # input
    @start_date = params[:start_date] # date format is stored in YY-MM-DD
    @end_date = params[:end_date]
    @guests = params[:guests] ? params[:guests].gsub(/[^0-9]/, '').to_i : 1 # default value in form is 1
    @city = params[:city]

    @flats = [] # initalize

    search_error?(@city, @guests, @start_date, @end_date)

    matching_flats = Flat.all.where(city: @city, capacity: (@guests..15))
    # Excludes according to unavailability table
    flats = generate_available_flats_from_unavailabilities(matching_flats, @start_date, @end_date)
    # Excludes according to booking table
    generate_available_flats_from_bookings(flats, @start_date, @end_date)

    redirect_to root_path, alert: "Nothing available for your dates. Try different dates." if @flats.nil?

  end

  private

  def search_error?(city, guests, start_date, end_date )

    if Time.now.strftime("%Y-%m-%d") > start_date
      redirect_to root_path, alert: "Do you really want to book a hut in the past \?\? Please go back to the future first !"
      return
    end
    if start_date > end_date
      redirect_to root_path, alert: "End date should before start date, please try again"
      return
    end

    flats_from_city = Flat.all.where(city: city)
    if flats_from_city.empty?
      redirect_to root_path, alert: 'Unfortunately, we don\'t have huts in that area :('
      return
    elsif flats_from_city.where(capacity: (guests..15)).empty?
      redirect_to root_path, alert: 'Unfortunately, we don\'t have flats available for this number of guests'
      return
    else
      true
    end
  end

  def generate_available_flats_from_unavailabilities(flats, search_start_date, search_end_date)
     c = search_start_date
     d = search_end_date
    flats.each do |f|
      can_be_added = true # initalize
      no_go = Unavailability.all.where(flat_id: f.id)
      no_go.each do |no|
        a = no.start_date.to_s # date format is stored in YY-MM-DD
        b = no.end_date.to_s
        if (c > a && c < b) || (d > a && d < b) || (c < a && d > a)
          can_be_added = false
          break
        end
      end
      @flats << f if can_be_added
    end
  end

  def generate_available_flats_from_bookings(flats, search_start_date, search_end_date)
     c = search_start_date
     d = search_end_date
    flats.each do |f|
      can_be_added = true # initalize
      no_go = Booking.all.where(flat_id: f.id)
      no_go.each do |no|
        a = no.start_date.to_s # date format is stored in YY-MM-DD
        b = no.end_date.to_s
        if (c > a && c < b) || (d > a && d < b) || (c < a && d > a)
          can_be_added = false
          break
        end
      end
      @flats << f if can_be_added
    end
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end


  def flat_params
    params.require(:flat).permit(:title, :description, :city, :capacity, :address, :price)
  end
end
