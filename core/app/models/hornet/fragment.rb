module Hornet
  class Fragment < ActiveRecord::Base
    
    attr_accessible :key, :type, :value
    
    belongs_to :node
    
    belongs_to :mnode
    accepts_nested_attributes_for :mnode
    attr_accessible :mnode_attributes
    
  end
end
