class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper
  helper_method :route_make_user?

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def route_make_user?
      if logged_in?
        @route = Route.find(params[:id])
        current_user.id == @route.user_id
      end
    end

end
