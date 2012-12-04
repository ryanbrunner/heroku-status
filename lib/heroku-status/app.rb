require 'json'
require 'rest_client'

module HerokuStatus
  class App
    def self.get(app_name)
      response = RestClient.get "https://:#{ENV['HEROKU_KEY']}@api.heroku.com/apps/#{app_name}/releases", {:accept => :json}
      json = JSON.parse(response)
      last_release = json.last
      App.new(last_release)
    end

    def initialize(release_json)
      @release_json = release_json
    end

    def commit
      @release_json['commit']
    end

    def current_branches

    end
  end
end
