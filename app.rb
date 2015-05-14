require('bundler/setup')
Bundler.require(:default, :development)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end
