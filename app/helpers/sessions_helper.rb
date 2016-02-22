module SessionsHelper

  def login(admin)
    session[:admin_id] = admin.id
    @current_admin = admin
  end

  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id])
  end

  def logged_in?
    if current_admin == nil
      redirect_to new_session_path
    end
  end

  def logout
    @current_admin = session[:admin_id] = nil
  end
  
end
