class Account::ResumesController < ApplicationController
  before_action :authenticate_user!
  layout "account"
  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes
  end
  def show
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end
  def edit
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end
  def update
    @job = Job.find(params(:job_id))
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)
    redirect_to account_job_resume_path(@job,@resume)
  end 

end
