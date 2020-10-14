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

  def edit
    current_project(params[:id])
  end

  def update
    current_project(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    current_project(params[:id])
    @project.destroy
    flash[:success] = "List deleted"
    redirect_to current_user
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end

  def current_project(id)
    @project = current_user.projects.find_by(id: id)
  end

end
