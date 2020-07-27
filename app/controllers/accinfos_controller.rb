class AccinfosController < ApplicationController
  before_action :authenticate_user!

  def create
    @accinfo = Accinfo.new(skill_params)
    respond_to do |format|
      if @accinfo.save
        format.html { redirect_back fallback_location: root_path, notice: 'Account info has been updated.' }
        format.json { render :show, status: :created, location: @accinfo }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @accinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @accinfo = Accinfo.find(params[:id])
    respond_to do |format|
      if @accinfo.update(skill_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Account info has been updated.' }
        format.json { render :show, status: :ok, location: @accinfo }
      else
        format.html { render :edit }
        format.json { render json: @accinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @accinfo = Accinfo.find(params[:id])
    @accinfo.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Account info has been removed.' }
      format.json { head :no_content }
    end
  end

  private

  def skill_params
    params.require(:accinfo).permit(:user_id,:accno,:bank,:branch,:ifsc,:name)
  end
end
