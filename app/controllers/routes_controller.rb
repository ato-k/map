class RoutesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update]

  def top
  end

  def index
    @routes = Route.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @route = Route.find(params[:id])
    impressionist(@route, nil, unique: [:ip_address])
  end

  def new
    @route = Route.new
  end

  def create
    @route = current_user.routes.new(route_params)
    if @route.save
      redirect_to @route
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if Rails.env.production?
      @route = Route.find(params[:id])
      if @route.images.exists?
        @route.images.purge
        @route.destroy
        redirect_to root_url, notice: "削除されました。"
      else
        @route.destroy
        redirect_to root_url, notice: "削除されました。"
      end
  
    else
      @route = Route.find(params[:id])
      @route.destroy
      redirect_to root_url, notice: "削除されました。"
    end
  end

  def search
    $keyword = params[:keyword]
    if $keyword.present?
      @routes = Route.search(params[:keyword]).paginate(page: params[:page], :per_page => 10)
      render "search"
      $keyword = nil
    else
      redirect_to root_url
    end
  end

  private

    def route_params
      params.require(:route).permit(:name, :start, :content0, :content1, :content2, :content3, :content4, :content5, :content6, :content7, :content8, :content9, images: [])
    end

end
