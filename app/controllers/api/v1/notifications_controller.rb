# frozen_string_literal: true

# Api::V1::NotificationsController
class Api::V1::NotificationsController < ApplicationController
  # POST /apnsp8
  def apnsp8
    apnsp8 = Apnsp8.new(apnsp8_params)
    if apnsp8.create
      render(json: { notification: apnsp8.notification }, status: 201)
    else
      render(json: {}, status: 422)
    end
  end

  private

  def apnsp8_params
    params.require(:notification).permit(
      :app_name,
      :device_token,
      :content_available,
      :alert,
      data: {}
    )
  end
end
