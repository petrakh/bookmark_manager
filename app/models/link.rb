require './app/data_mapper_setup'
require_relative 'tag'

class Link
  include DataMapper::Resource

  has n, :tags, through: DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String

end
DataMapper.finalize
