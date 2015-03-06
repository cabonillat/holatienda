class UsersController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy]

  #users/
  def index
  	@users = User.all
  	#puts "#{@users.inspect}"
  end

  #users/123
  def show
  end

  #users/new
  def new
  	@user = User.new
  end

  #users/
  def create
  	params_filtered = params.require(:user).permit(:name, :email, :password, :avatar)
  	#params_filtered = {name: "michel", email:"michel@gmai.com", password:"2131312"}
  	@user = User.new(params_filtered)
  	if @user.save
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    params_filtered = params.require(:user).permit(:name, :email)
    if @user.update(params_filtered)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  #delete /user/1
  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Usuario eliminado'
  end

  def load_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to users_path, 
        notice: 'El usuario no existe en el sistema'
    end
  end

  def login
    @user = User.new
  end

  def do_login
    params_filtered = params.require(:user).permit(:email, :password)
    @user = User.new(params_filtered)
    user_fetch = @user.login
    if user_fetch
      session[:user_id] = user_fetch.id
      redirect_to products_path, notice: 'Bienvenido a la tiendita'
    else
      flash.now[:error] = 'Error al autenticarse'
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_users_path, notice: 'Vuelve pronto :('
  end

end






