##
# To use, comment out one of the blocks below!

use Rack::Static, 
  :urls => ["/images", "/js", "/css"],
  :root => "public"

# To always serve one kind of file...
run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('public/index.html', File::RDONLY)
  ]
}

# To use the public directory as a basis
use Rack::Rewrite do
  rewrite '/', '/index.html'
end

run Rack::Directory.new('public')
