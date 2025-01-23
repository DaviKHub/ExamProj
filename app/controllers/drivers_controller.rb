class DriversController < ApplicationController
  before_action :set_driver, only: %i[ show edit update destroy ]

  # GET /drivers or /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1 or /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers or /drivers.json
  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      flash[:success] = "Водитель успешно добавлен!"
      redirect_to drivers_path
    else
      flash.now[:danger] = "Ошибка! Проверьте введенные данные."
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drivers/1 or /drivers/1.json
  def update
    if @driver.update(driver_params)
      flash[:success] = "Водитель успешно обновлен!"
      redirect_to drivers_path
    else
      flash.now[:danger] = "Ошибка! Проверьте введенные данные."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /drivers/1 or /drivers/1.json
  def destroy
    @driver.destroy!

    respond_to do |format|
      format.html { redirect_to drivers_path, status: :see_other, notice: "Водитель успешно удален." }
      format.json { head :no_content }
    end
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:name, :license_number, :phone, :car_id, :photo)
  end
end
