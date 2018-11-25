class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end


  def new
    @project = Project.new
  end


  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project successfully created"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render action: 'new'
    end
  end

  def edit
  end


  def update
    if @project.update_attributes(project_params)
      flash[:success] = "Project was successfully updated"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render action: 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = 'Project was successfully deleted.'
      redirect_to projects_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to projects_path
    end
  end

  private
  def project_params
    params.require(:project).permit(
      :name, :country, :city, :neighborhood, :address,
      :phone_number, :description, :stratum, :activated,
      :sales_room_address, :sales_room_phone, :sales_room_email,
      :estimated_start_date, :estimated_end_date
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
