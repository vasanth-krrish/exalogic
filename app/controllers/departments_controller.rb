class DepartmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    respond_to do |format|
      if @department.save
        format.html { redirect_back fallback_location: root_path, notice: 'Department has been updated.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Department has been updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Department has been removed.' }
      format.json { head :no_content }
    end
  end

  private

  def department_params
    params.require(:department).permit(:user_id,:department,:designation)
  end
end
