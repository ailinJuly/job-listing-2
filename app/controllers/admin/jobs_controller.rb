class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"

  def index
    @jobs = Job.all.recent.paginate(:page => params[:page], :per_page => 5 )
  end

  def  show

    @job =Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
      @job = Job.find(params[:id])

    @job.destroy
    redirect_to admin_jobs_path
      flash[:alert] = 'deleted!'
  end

  def publish
    @job = Job.find(params[:id])

    @job.publish!

      redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])

    @job.hide!

      redirect_to :back
  end

  private
    def job_params
    params.require(:job).permit(:title, :description,:contact_email, :is_hidden, :category)
  end
end
