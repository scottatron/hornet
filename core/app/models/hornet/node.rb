module Hornet
  class Node < ActiveRecord::Base
    attr_accessible :name, :type, :url
    
    has_many :fragments
    accepts_nested_attributes_for :fragments
    attr_accessible :fragments_attributes
    
  end
end
