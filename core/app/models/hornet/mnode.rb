module Hornet
  class Mnode < ActiveRecord::Base
    attr_accessible :file, :name, :type
    image_accessor :file
  end
end
