class JobsController < ApplicationController

  def index
    @jobs = case params[:order]
    when "by wage_lower_bound"
      Job.published.order("wage_lower_bound DESC")
    when "by wage_upper_bound"
      Job.published.order("wage_upper_bound DESC")
    else
      Job.published.recent
    end
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

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :hidden)

  end
end
