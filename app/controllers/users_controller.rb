class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    @routes = @user.routes.paginate(page: params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:success] = "入力されたメールアドレスへ登録完了用リンクを送信しました。"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def message
    @message = Message.new
    @messages = current_user.messages.all
  end

  def message_create
    @message = Message.new(message_params)
    @message.save
    redirect_to request.referrer
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def message_params
      params.permit(:user_id, :content)
    end
    
end
