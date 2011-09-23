require 'httparty'

class Gem::Commands::VersionsCommand < Gem::Command

  def initialize
    super 'versions', description
  end

  def description
    'List all published versions of a gem.  Versions you have installed locally are asterisked.'
  end

  def arguments
    'GEMNAME        exact name of gem for which to list versions'
  end

  def usage
    "#{program_name} GEMNAME"
  end

  def execute
    name = get_one_gem_name
    locals = local_versions name

    begin
      response = ::HTTParty.get "https://rubygems.org/api/v1/versions/#{name}.json"
    rescue MultiJson::DecodeError # Rubygems' invalid JSON response of plain text trips up HTTParty.
      puts "Unable to find #{name}."
      return
    end

    if response.code == 200
      remotes = response.map { |item| item['number'] }.map { |v| Gem::Version.create v }.sort.reverse.map &:to_s
      remotes.each do |r|
        puts "#{locals.include?(r) ? '*' : ' '} #{r}"
      end
    else
      puts "Unable to find #{name}."
    end
  end

  def local_versions(gem_name)
    Gem::Specification.find_all_by_name(gem_name).map { |spec| spec.version.to_s }
  end

end
