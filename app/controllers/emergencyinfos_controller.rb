class EmergencyinfosController < ApplicationController
  before_action :authenticate_user!

  def create
    @emergencyinfo = Emergencyinfo.new(emergencyinfo_params)
    respond_to do |format|
      if @emergencyinfo.save
        format.html { redirect_back fallback_location: root_path, notice: 'Emergency info has been updated.' }
        format.json { render :show, status: :created, location: @emergencyinfo }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @emergencyinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @emergencyinfo = Emergencyinfo.find(params[:id])
    respond_to do |format|
      if @emergencyinfo.update(emergencyinfo_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Emergency info has been updated.' }
        format.json { render :show, status: :ok, location: @emergencyinfo }
      else
        format.html { render :edit }
        format.json { render json: @emergencyinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @emergencyinfo = Emergencyinfo.find(params[:id])
    @emergencyinfo.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Emergency info has been removed.' }
      format.json { head :no_content }
    end
  end

  private

  def emergencyinfo_params
    params.require(:emergencyinfo).permit(:name,:relation,:contact,:address,:city,:state,:country,:pincode, :user_id)
  end
end
