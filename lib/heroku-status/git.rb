require 'grit'

module HerokuStatus
  class Git
    def branches
      Hash[ repo.branches.map {|b| [b.name, b.commit.to_s[0..6]] } ]
    end

  private

    def repo
      # TODO: Other directories?
      Grit::Repo.new(Dir.pwd)
    end

  end
end