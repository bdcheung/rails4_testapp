source 'https://rubygems.org'

# # gem 'rails', "~> 4.0.0"
ruby '2.1.1'

# for rails 4, you'll need these.  BCMS is holding us back now.
gem 'activeresource', :require => 'active_resource'
gem 'rails-observers'
gem 'actionpack-page_caching'

gem 'whenever', '0.4.2.1', :git => 'git://github.com/asee/whenever.git'
gem 'mysql2'

# gem 'newrelic_rpm'
# gem 'honeybadger'
gem 'rmagick', '2.13.2', :require => false

gem 'fastercsv'
gem 'haml'
gem 'aasm'
# use the git source until some release after 3.3.0, see https://github.com/binarylogic/authlogic/pull/369
gem 'authlogic', git: "https://github.com/binarylogic/authlogic", :ref => 'abc09970ed1fad98c6c12f4ca64d1670d37d11db'
gem 'nokogiri', '1.4.4' # used for the omnifind plugin, does not have to be that version specifically.
gem 'json'#, :version => '1.4.6'
gem "pdf-toolkit", "~> 1.0.0.rc1"
gem 'daemons', '1.0.10'
gem 'acts_as_versioned', :git => "https://github.com/asee/acts_as_versioned"
gem 'file_column', :git => 'git@github.com:asee/file_column.git'
gem "rtex", :git => 'https://github.com/asee/rtex'
gem 'acts_as_list'
gem 'rubyzip'
gem 'dynamic_form' # providing error_messages_for
gem 'rails_autolink' # bringing back auto_link
gem 'make_resourceful', :git => "https://github.com/asee/make_resourceful" # updated to not conflict with rails

group :development do
  gem "capistrano"
end

group :test do
  gem 'faker', '0.3.1'
  gem 'shoulda', :require => false
  gem 'shoulda-matchers', :require => false
  gem 'machinist', "~> 2.0"
  gem 'byebug'
  gem 'pry-byebug'
  gem 'mocha', :require => false
end

group :development, :test do
  gem 'seed-fu', github: 'mbleigh/seed-fu'
  gem 'sprockets_better_errors'
end


# gem 'admin', :git => 'git@git.asee.org:plugins/admin.git', :branch => :rails4
gem 'apply', path: "../gems/apply-rails4"
gem 'admin', :path => '../gems/admin-rails4'
gem 'asee_utilities', :git => 'git@git.asee.org:plugins/asee_utilities.git'

gem 'deploy', :git => 'git@git.asee.org:gems/deploy.git', :branch => :realgem
gem "authenticated_system", :git => 'git@git.asee.org:gems/authenticated_system.git', :branch => :master
# someday:
#gem 'reporting', :git => 'git@git.asee.org:plugins/reporting.git', :branch => :master
gem 'reporting', :path => '../gems/reporting'

# gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug'
