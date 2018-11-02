class RegistrationController < ApplicationController
 def new
  end

  def create
    @user_current = User.where(username: params[:name], password: params[:password]).first
    ApplicationController.set_session(@user_current)
    if @user_current
      session[:user_id] = @current_user.id
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to(gossips_path)
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"	
      redirect_to(invalid_login_password_path)
    end
  end

  def logout
    ApplicationController.set_session(nil)
    session[:user_id] = nil
    flash[:info] = "Vous êtes maintenant déconnecté."
    redirect_to(root_path)
  end

end
def home
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
 end

  