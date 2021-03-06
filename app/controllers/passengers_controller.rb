class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(:name).paginate(page: params[:page], per_page: 25)
  end
  
  def show
    @passenger = Passenger.find_by(id: params[:id])
    
    if @passenger.nil?
      redirect_to passengers_path
      return
    end
  end
  
  def new
    @passenger = Passenger.new
  end
  
  def create
    if params[:passenger].nil?
      redirect_to new_passenger_path
    end
    
    @passenger = Passenger.new(passenger_params)
    
    if @passenger.save
      redirect_to passenger_path(@passenger.id)
      return
    else
      render :new
      return
    end
  end
  
  def edit
    @passenger = Passenger.find_by(id: params[:id])
    
    if @passenger.nil?
      redirect_to passengers_path
      return
    end 
  end
  
  def update
    @passenger = Passenger.find_by(id: params[:id])
    
    if @passenger.nil?
      redirect_to passengers_path
      return
    elsif @passenger.update(passenger_params)
      redirect_to passenger_path
      return
    else
      render :edit
      return
    end
  end
  
  def destroy
    @passenger = Passenger.find_by(id: params[:id])
    
    @passenger.destroy if @passenger
    
    redirect_to passengers_path
  end
  
  private
  
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end
