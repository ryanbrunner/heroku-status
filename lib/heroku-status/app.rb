require 'json'
require 'rest_client'

module HerokuStatus
  class App
    def self.get(app_name, source_repo_path)
      response = RestClient.get "https://:#{ENV['HEROKU_KEY']}@api.heroku.com/apps/#{app_name}/releases", {:accept => :json}
      json = JSON.parse(response)
      last_release = json.last
      App.new(last_release, source_repo_path)
    end

    def initialize(release_json, source_repo_path)
      @release_json = release_json
      @source_repo = Git.new(source_repo_path)
    end

    def commit
      @release_json['commit']
    end

    def current_branches
      @source_repo.branches.select{|name,commit| commit == self.commit }.keys
    end
  end
end
