require "http/server"

require "./rest/*"

module Blaspheme::REST
  ALL_ACTIONS = [
    :create,
    :read,
    :update,
    :delete,
    :list
  ]

  def respond_with_json(env : HTTP::Server::Context)
    env.response.content_type = "application/json" # REPLACE CONFIG
  end

  def resource(
    path,
    model,
    actions = ALL_ACTIONS,
    prefix = "/"
  )
    res = Resource(typeof(model)).new(model, path, actions, prefix)
    res.generate_routes!
  end
end
