class AdminController < ApplicationController
  before_action :authorized?

  private
  def authorized?
    unless current_member.try(:role) == 'admin'
      render json: 401
    end
  end
end
