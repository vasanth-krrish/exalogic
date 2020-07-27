class SkillsController < ApplicationController
  before_action :authenticate_user!

  def create
    @skill = Skill.new(skill_params)
    respond_to do |format|
      if @skill.save
        format.html { redirect_back fallback_location: root_path, notice: 'Skill has been updated.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @skill = Skill.find(params[:id])
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Skill has been updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Skill has been removed.' }
      format.json { head :no_content }
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:user_id,:skill,:experience)
  end
end
