##
# To use, comment out one of the blocks below!
require 'rack/rewrite'

use Rack::Static, 
  :urls => ["/images", "/js", "/css", "/fonts"],
  :root => "public"
#  :index => 'index.html'

# To always serve one kind of file...
#run lambda { |env|
#  [
#    200, 
#    {
#      'Content-Type'  => 'text/html', 
#      'Cache-Control' => 'public, max-age=86400' 
#    },
#    File.open('public/index.html', File::RDONLY)
#  ]
#}

# To use the public directory as a basis
use Rack::Rewrite do
  rewrite '/', '/index.html'
  
  %w{ tos api security platforms ideas/iap ideas/cards ideas/packages ideas/appointments }.each do |key|
    rewrite "/#{key}", "/#{key}/index.html"
    rewrite "/#{key}/", "/#{key}/index.html"
  end

  moved_permanently   '/cwp', '/ian_lloyd_capitalism_without_profit.pdf'
  moved_permanently   '/cwp.pdf', '/ian_lloyd_capitalism_without_profit.pdf'
  
end

run Rack::Directory.new('public')
