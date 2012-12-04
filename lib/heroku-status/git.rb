require 'grit'

module HerokuStatus
  class Git

    attr_reader :repo

    def initialize(repo_path)
      @repo = Grit::Repo.new(repo_path)
    end

    def branches
      Hash[ repo.branches.map {|b| [b.name, b.commit.to_s[0..6]] } ]
    end

  private


  end
end