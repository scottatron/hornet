module Hornet
  class Mnode < ActiveRecord::Base
    attr_accessible :file, :name, :type
    dragonfly_accessor :file do
      storage_options do |a| 
        { path: "#{Site.larva}/#{Time.now.year}/#{Time.now.month}/#{((Time.now.usec*10) + rand(100)).to_s(32)}.#{a.format}" }
      end
      default 'app/assets/images/default-image.jpg'
    end
 end
end
