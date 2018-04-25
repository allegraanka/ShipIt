class JobsController < ApplicationController
  def index
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @ships = Ship.all
    @minimum_description_length = 50
  end

  def create
    Job.create(job_params)
    redirect_to dashboard_index_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_update_params)
    redirect_to job_path(@job.id)
  end

  def delete
  end

  def destroy
  end

  private

  def job_params
    params.require(:job).permit(:name, :description, :origin, :destination, :cost, :total_containers, :ship_id, :shipper_id)
  end

  def job_update_params
    params.require(:job).permit(:name, :description, :origin, :destination, :cost, :total_containers, :shipper_id)
  end

end
