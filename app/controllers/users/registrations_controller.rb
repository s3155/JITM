class Users::RegistrationsController < Devise::RegistrationsController
    protected
  
    def after_update_path_for(resource)
      dash_boards_path
    end
  end
  