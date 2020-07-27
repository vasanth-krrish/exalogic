class UsersController < ApplicationController
  before_action :is_admin, except: [:index, :show, :edit, :destroy]
  before_action :authenticate_user!, only: [:index,:show, :edit, :destroy]
  before_action :is_user, only: :show

  def index
    if current_user.has_role? :user
      redirect_to user_path(current_user)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @user.build_basicinfo.save
        @user.basicinfo.update(empid: 'EXA' << @user.id.to_s.rjust(4,'0'))
        @user.build_department.save
        @user.accinfos.build.save
        @user.emergencyinfos.build.save
        @user.skills.build.save
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.has_role?(:admin) || current_user == @user
      respond_to do |f|
        f.html { redirect_back fallback_location: root_path, alert: 'You are not authenticated to view the page..' }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    unless current_user.has_role?(:admin) || current_user == @user
      respond_to do |f|
        f.html { redirect_back fallback_location: root_path, alert: 'You are not authenticated to view the page..' }
      end
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'User has been removed.' }
      format.json { head :no_content }
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def is_admin
    unless user_signed_in? && current_user.has_role?(:admin)
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path , alert: 'You are not authenticated to view the page..' }
      end
    end
  end

  def is_user
    unless current_user.has_role?(:admin )|| current_user == User.find(params[:id])
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path , alert: 'You are not authenticated to view the page..' }
      end
    end
  end

end
