class BasicinfosController < ApplicationController
  before_action :authenticate_user!

  def create
    @basicinfo = Basicinfo.new(basicinfo_params)
    respond_to do |format|
      if @basicinfo.save
        format.html { redirect_back fallback_location: root_path, notice: 'Basic info has been updated.' }
        format.json { render :show, status: :created, location: @basicinfo }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @basicinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @basicinfo = Basicinfo.find(params[:id])
    respond_to do |format|
      if @basicinfo.update(basicinfo_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Basic info has been updated.' }
        format.json { render :show, status: :ok, location: @basicinfo }
      else
        format.html { render :edit }
        format.json { render json: @basicinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def basicinfo_params
    params.require(:basicinfo).permit(:dob,:doj,:user_id,:empid,:bloodtype,:contact,:gender,:address,:city,:state,:country,:pincode,:avatar)
  end

end
