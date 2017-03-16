class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"
  def index
    @jobs = Job.all
  end
  def show
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: "创建成功！"
    else
      render :new
    end
  end
  def edit
    @job = Job.find(params[:id])
  end
  def update
    @Job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "更新成功！"
    else
      render :edit
    end
  end
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, notice: "已成功删除！"
  end
  def require_is_admin
    if !current_user.admin?
       redirect_to jobs_path,alert: "你不是管理员，休要进来!"
    end
  end
  private

  def job_params
     params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end


end
