class PingController < ActionController::API
  def ping
    render plain: "pong"
  end
end
