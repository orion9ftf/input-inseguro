class ApplicationController < ActionController::Base
  # Redirige al Inicio para Parámetros Inválidos
  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_path, alert: 'Resource not found'
  end

  rescue_from ActionController::RoutingError do
    redirect_to root_path, alert: 'Invalid route'
  end
end
