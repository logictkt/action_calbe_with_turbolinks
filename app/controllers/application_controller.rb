class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by_id(session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    return @current_user
  end

  def login_required
    return if current_user.present?
    flash[:alert] = 'ユーザーを選択してください'
    redirect_to login_path and return
  end
end
