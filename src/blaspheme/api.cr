require "./rest"

module Blaspheme::API
  extend REST

  PATH_PREFIX = "/api/"
  resource "posts", Models::Post, prefix: PATH_PREFIX

  get "/" do |env|
    respond_with_json(env)

    {"hello" => "world"}.to_json()
  end
end
