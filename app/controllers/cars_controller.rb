class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    Rails.logger.debug "PARAMS RECEIVED: #{params.inspect}" # Выведет параметры в логи
    @car = Car.new(car_params)

    if @car.save
      redirect_to cars_path, notice: "Успешно создано."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to cars_path, notice: "Успешно обновлено." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car = Car.find(params[:id]) # Убедимся, что объект найден

    if @car.destroy
      respond_to do |format|
        format.html { redirect_to cars_path, notice: "Машина успешно удалена." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to cars_path, alert: "Ошибка при удалении машины." }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:brand, :model, :plate_number, :year)
  end
end
