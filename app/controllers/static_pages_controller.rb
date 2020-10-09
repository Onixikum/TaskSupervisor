class StaticPagesController < ApplicationController

  def welcome
    redirect_to user_root_path if current_user
  end
end
