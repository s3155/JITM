class Users::ConfirmationsController < Devise::ConfirmationsController
    before_action :set_default_format
  
    def create
      self.resource = resource_class.send_confirmation_instructions(resource_params)
      yield resource if block_given?
  
      respond_to do |format|
        if successfully_sent?(resource)
          format.html { redirect_to after_resending_confirmation_instructions_path_for(resource_name), notice: '確認指示を再送信しました。' }
          format.json { render json: { message: '確認指示を再送信しました。' }, status: :ok }
        else
          format.html { render :new }
          format.json { render json: resource.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
  
    def set_default_format
      request.format = :html if params[:format].nil? || !%w[html json].include?(params[:format])
    end
  end
  