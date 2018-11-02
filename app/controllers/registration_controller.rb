class RegistrationController < ApplicationController
 def new
  end

  def create
    puts   "----------------------------------------"
    @user_current = User.where(username: params[:pseudo], password: params[:password])
    ApplicationController.set_session(@user_current)
puts @user_current
    puts   "----------------------------------------"
    if @user_current
     
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to(gossips_path)
    else
      
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

  