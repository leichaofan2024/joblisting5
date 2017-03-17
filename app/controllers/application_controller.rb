class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def require_is_admin
    if !current_user.admin?
       redirect_to jobs_path,alert: "你不是管理员，休要进来!"
    end
  end
end
