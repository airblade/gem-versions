require 'httparty'

class Gem::Commands::VersionsCommand < Gem::Command

  def initialize
    super 'versions', description
  end

  def description
    'List all published versions of a gem'
  end

  def arguments
    'GEMNAME        exact name of gem for which to list versions'
  end

  def usage
    "#{program_name} GEMNAME"
  end

  def execute
    name = get_one_gem_name
    response = ::HTTParty.get "https://rubygems.org/api/v1/versions/#{name}.json"
    if response.code == 200
      puts response.map { |item| item['number'] }.join "\n"
    else
      puts "Unable to find #{name}."
    end
  rescue  # Annoyingly Rubygems' API doesn't return JSON on a 404 response, tripping up HTTParty.
    puts "Unable to find #{name}."
  end

end
