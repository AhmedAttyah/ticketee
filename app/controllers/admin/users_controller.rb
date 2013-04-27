class Admin::UsersController < Admin::BaseController
  before_filter :find_user, only: [:show,:update,:delete,:edit]

  def index
    @users= User.all(order: "email")
  end

  def new 
  	@user= User.new
  end

  def create
  	@user = User.new (params[:user])
  	if @user.save
      redirect_to admin_users_path, notice: "User has been created."
  	else
  		flash[:error]= "User has not been created."
  		render :new
  	end
  end

  def show 
  end

  def destroy
    @user= User.find(params[:id])
    if @user != current_user
      @user.destroy
      flash[:notice] = "User has been deleted."
      redirect_to admin_users_path
    else
      flash[:alert] = "You cannot delete yourself!"
      render :show
    end
  end


  def edit
  end
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)

    end
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path, notice: "User has been updated."
    else
      flash[:error]= "User has not been updated."
      render :edit
    end
  end
  private 
  def find_user 
    @user= User.find(params[:id])
  end
end
