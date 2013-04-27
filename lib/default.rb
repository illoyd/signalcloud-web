# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

gem 'haml'
gem 'maruku'

include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering

module ToolKitHelper
  def logo
    "<span class='logo'><i class='icon-cloud'></i><i class=icon-bolt'></i></span>"
  end
end
