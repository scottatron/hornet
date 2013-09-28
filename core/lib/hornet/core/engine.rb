module Hornet
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Hornet
      engine_name 'hornet'
    
      config.generators do |g|
        g.test_framework :rspec, view_specs: false
        g.fixture_replacement :factory_girl, dir: 'lib/spec_support/factories'
        g.assets false
        g.helper false
      end
      
    end
  end
end
