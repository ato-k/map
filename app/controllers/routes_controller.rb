class RoutesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update]

  def top

  end

  def index
    @routes = Route.all
  end

  def show
    @route = Route.find(params[:id])
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to @route
    else
      flash.now[:alert] = 'やり直し'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def route_params
      params.require(:route).permit(:name, :content)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

end
