class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception

    # Your other code...
  
    # def after_sign_in_path_for(resource)
    #   # Redirect to the students#index page after sign in
    #   students_path
    # end
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?
     
    rescue_from Pundit::NotAuthorizedError do |exception|
        redirect_to root_url, alert: exception.message
    end
    protected
     
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type,:email, :password])
    end
    private
     
    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end

end

