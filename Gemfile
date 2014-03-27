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
# gem 'sunspot_rails'
# gem 'sunspot_solr'
gem "pdf-toolkit", "~> 1.0.0.rc1"
gem 'daemons', '1.0.10'
# gem 'delayed_job_active_record'

# specific BCMS commit referenced from https://groups.google.com/forum/#!topic/browsercms/dUy41BOfAIY as being rails4 compliant 
# gem "browsercms", git: "https://github.com/browsermedia/browsercms", :ref => '2298b86c82cca92f049398679bf93bd2d36567ae'
# gem "browsercms", "4.0.0.alpha"
# gem "browsercms", :path => '../../browsercms' # for dev
# gem "browsercms", git: "https://github.com/jamesprior/browsercms" # for now, it has important changes

# gem 'money-rails'
# gem 'acts_as_versioned', :git => "https://github.com/asee/acts_as_versioned"
# gem 'acts_as_tree'
# gem 'activemerchant'
# gem 'file_column', :path => 'vendor/gems/file_column-0.3.2', :require => 'rails_file_column'
# gem "rtex", :git => 'https://github.com/asee/rtex'
# gem "omnifind", :git => 'https://github.com/asee/omnifind'
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
gem 'apply', path: "../apply-rails4"
gem 'admin', :path => '../admin-rails4'

gem 'deploy', :git => 'git@git.asee.org:gems/deploy.git', :branch => :realgem
gem "authenticated_system", :git => 'git@git.asee.org:gems/authenticated_system.git', :branch => :master
# someday:
#gem 'reporting', :git => 'git@git.asee.org:plugins/reporting.git', :branch => :master
#gem 'reporting', :path => '../reporting'

# gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug'
