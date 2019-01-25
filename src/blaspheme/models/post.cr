require "mongo_orm"

module Blaspheme
  class Models::Post < Mongo::ORM::Document
    field title : String
    field body : String
    timestamps
  end
end
