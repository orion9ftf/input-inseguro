class Rack::Attack
  # Limitar Intentos de Fuerza Bruta
  throttle('requests by ip', limit: 60, period: 1.minute) do |req|
    req.ip
  end
end