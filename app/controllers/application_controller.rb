# frozen_string_literal: true

#
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order

  protected

  def after_sign_in_path_for(resource)
    if cookies[:from_checkout]
      cookies.delete :from_checkout
      checkout_path(:addresses)
    else
      super
    end
  end

  private

  def current_order
    return Order.new unless session[:order_id]
    Order.find(session[:order_id])
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
  end
end
