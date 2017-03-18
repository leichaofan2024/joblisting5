class Account::JobsController < ApplicationController
  before_action :authenticate_user!
  layout "account"
  def index
    @jobs = current_user.jobs
  end
  def show
    @job = Job.find(params[:id])
  end
  

end
