require "yaml"

module Octopus
  def self.env()
    @env ||= defined?(Rails) ? Rails.env.to_s : "octopus"      
  end
  
  def self.config()
    @config ||= YAML.load_file(Octopus.directory() + "/config/shards.yml") 
  end

  # Returns the Rails.root_to_s when you are using rails
  # Running the current directory in a generic Ruby process
  def self.directory()
    @directory ||= defined?(Rails) ?  Rails.root.to_s : Dir.pwd     
  end
end


require "octopus/model"
require "octopus/persistence"
require "octopus/migration"

if ActiveRecord::VERSION::STRING > '2.4.0'
  require "octopus/rails3/association"
  require "octopus/rails3/association_collection"
  require "octopus/rails3/has_and_belongs_to_many_association"
else
  puts "Rails 2"
end

require "octopus/proxy"
require "octopus/scope_proxy"
require "octopus/controller"

