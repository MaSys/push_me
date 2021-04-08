# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
```
2.7.1
```

* System dependencies

* Configuration
Before start sending notifications, check [.env.example](.env.example) file to set your env variables and then you need to create an RPush application, chech [notify.rake](lib/tasks/notify.rake) task to init a new app from env variables.

* Database creation
```bash
$ rake db:create
```

* Database initialization
```bash
$ rake db:migrate
```

* How to run the test suite
```bash
$ rubocop
```
```bash
$ rspec
```

* Services (job queues, cache servers, search engines, etc.)
```bash
$ bundle exec rpush start
```

* Deployment instructions

## Usage

### APNSP8
```
POST /api/v1/notifications/apnsp8
```
Alert notification:
```json
{
    "notification": {
        "app_name": "",
        "device_token": "",
        "alert": "if you are sending an alert",
        "data": {
            "foo": "bar"
        }
    }
}
```
Background notification:
```json
{
    "notification": {
        "app_name": "",
        "device_token": "",
        "content_available": true,
        "data": {
            "headers": {
                "apns-push-type": "background"
            },
            "foo": "bar"
        }
    }
}
```

## Licence

[MIT License](LICENCE)
