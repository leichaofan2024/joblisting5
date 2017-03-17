class Account::JobsController < ApplicationController
  before_action :authenticate_user!
  def index
    @jobs = case params[:order]
       when "by wage_lower_bound"
         current_user.jobs.order("wage_lower_bound DESC")
       when "by wage_upper_bound"
         current_user.jobs.order("wage_upper_bound DESC")
       else
         current_user.jobs.order("created_at DESC")
       end
  end


end
