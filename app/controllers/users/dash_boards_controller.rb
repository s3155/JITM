# app/controllers/users/dash_boards_controller.rb

class Users::DashBoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    # ダッシュボードのコードをここに追加する
  end
end
