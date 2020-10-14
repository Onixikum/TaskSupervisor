class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end

end
