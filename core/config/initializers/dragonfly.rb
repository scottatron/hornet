require 'dragonfly'
require 'dragonfly/s3_data_store'

class DevelopmentDatastore < Dragonfly::FileDataStore

  def read(relative_path)
    validate_path!(relative_path)
    path = absolute(relative_path)
    pathname = Pathname.new(path)

    if pathname.exist?
      [
        pathname,
        (
          if store_meta?
            meta_store.read(path) || deprecated_meta_store.read(path) || {}
          end
        )
      ]
    else
      [Rails.root.join('app/assets/images/default-image.jpg'), {}]
    end
  end

end

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "a265e30fabc8be41803367790755ebda87b2ec9138f0071f47f40c0bb65991a3"

  url_format "/media/:job/:name"

  if Rails.env.development?
    datastore DevelopmentDatastore.new root_path: Rails.root.join('public/system/dragonfly', Rails.env), server_root: Rails.root.join('public')
  else
    if ENV['S3_KEY']
      datastore :s3,
        bucket_name: (ENV['S3_BUCKET'] || 'hornet-r32'),
        access_key_id: ENV['S3_KEY'],
        secret_access_key: ENV['S3_SECRET'],
        region: 'ap-southeast-2'
    else
      datastore :file,
        root_path: Rails.root.join('public/system/dragonfly'),
        server_root: Rails.root.join('public')
    end
  end

  processor :optim do |content, *args|
    content
  end

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
