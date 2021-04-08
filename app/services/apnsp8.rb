# frozen_string_literal: true

# APN SP 8 Notification
class Apnsp8
  # @author Yaser Almasri
  # Initializer
  # @params app_name String
  # @params device_token String
  # @params content_available Bool
  # @params alert String
  # @params data Hash
  def initialize(arguments = {})
    @params = arguments
  end

  # @author Yaser Almasri
  #
  # @return true/false
  def create
    build
    notification.save!
  end

  # RPush APN SP 8 Notification
  def notification
    @notification ||= Rpush::Apnsp8::Notification.new
  end

  private

  def build
    notification.app = app
    notification.device_token = device_token
    notification.content_available = content_available
    notification.alert = alert
    notification.data = data
  end

  def app
    Rpush::Apnsp8::App.find_by_name(@params[:app_name])
  end

  def device_token
    @params[:device_token]
  end

  def content_available
    @params[:content_available]
  end

  def alert
    @params[:alert]
  end

  def data
    @params[:data].as_json
  rescue StandardError
    {}
  end
end
