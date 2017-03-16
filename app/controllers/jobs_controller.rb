class JobsController < ApplicationController

  def index
    @jobs = case params[:order]
    when "by wage_lower_bound"
      Job.all.order("wage_lower_bound DESC")
    when "by wage_upper_bound"
      Job.all.order("wage_upper_bound DESC")
    else
      Job.all.recent
    end
  end
  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email)

  end
end
