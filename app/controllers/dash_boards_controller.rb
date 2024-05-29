class DashBoardsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      # ダッシュボードのロジックをここに書きます
    end
  end
  