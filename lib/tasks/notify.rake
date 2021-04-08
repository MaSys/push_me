namespace :notify do
  namespace :apnsp8 do
    task init: :environment do
      app = Rpush::Apnsp8::App.new
      app.name = ENV['APP_NAME']
      app.apn_key = File.read(ENV['APN_KEY'])
      app.environment = Rails.env
      app.apn_key_id = ENV['APN_KEY_ID']
      app.team_id = ENV['TEAM_ID']
      app.bundle_id = ENV['BUNDLE_ID']
      app.connections = 1
      app.save!
    end

    task back: :environment do
      n = Rpush::Apnsp8::Notification.new
      n.app = Rpush::Apnsp8::App.find_by_name(ENV['APP_NAME'])
      n.device_token = ENV['DEVICE_TOKEN']
      n.content_available = true
      n.data = {
        'headers': {
          'apns-push-type': 'background'
        },
        hi: :name,
        last: :hi
      }
      n.save!
    end

    task ios: :environment do
      n = Rpush::Apnsp8::Notification.new
      n.app = Rpush::Apnsp8::App.find_by_name(ENV['APP_NAME'])
      n.device_token = ENV['DEVICE_TOKEN']
      n.alert = "hi mom!"
      n.data = { foo: :bar }
      n.save!
    end
  end
end
