require "mongo_orm"
require "kemal"

module Blaspheme::REST
  class InvalidAction < Exception end

  class Resource(T)
    include REST

    def initialize(
      @model : T, # Compiler hint to find to actual Mongo Document
      @path : String,
      @actions : Array(Symbol),
      @prefix : String
    )

    end

    def list
      get File.join(@prefix, @path) do |env|
        respond_with_json(env)

        results = @model.all()
        { @path => results }.to_json()
      end
    end

    def generate_routes!
      puts "Generating routes!!!"
      @actions.each do |action|
        case action
        when :list
          list()
        # else
        #   raise InvalidAction.new("Invalid action")
        end
      end
    end
  end
end
