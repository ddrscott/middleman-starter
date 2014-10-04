# bring in custom helpers
require 'lib/custom_helpers'
helpers CustomHelpers

require 'lib/javascript_helper'
helpers JavascriptHelper

activate :automatic_image_sizes
activate :directory_indexes

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'some.bucket.name'
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  ignore "javascripts/**/*"
end

# Automatic image dimensions on image_tag helper
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions']
  config.cascade  = true
  config.inline   = false
end

# Live-reload for testing
ignore('/.idea/*')
ignore('/config.rb')
ignore('/vendor/*')

configure :development do
  activate :livereload
end

after_configuration do
  sprockets.append_path 'vendor/'
end