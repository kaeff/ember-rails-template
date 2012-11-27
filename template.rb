# Gems
gem 'ember-rails'

# Add ember variant selection
["development", "production"].each do |env|
  application(nil, :env => env) do
    "# Sets which variant of ember to include\n  config.ember.variant = :#{env}\n"
  end
end

# Create app controller and view to serve ember app
create_file 'app/controllers/app_controller.rb', <<-eos
class AppController < ApplicationController
  # GET /
  def index
    # Use this action to bootstrap your ember app
  end
end
eos
create_file 'app/views/app/index.html.erb', ""

# Route / to app#index
route("root to: 'app#index'")
remove_file 'public/index.html'

generate "ember:bootstrap"
