module Hornet
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Hornet
      engine_name 'hornet'
    
      config.generators do |g|
        g.test_framework :rspec, view_specs: false
      end
    end
  end
end
