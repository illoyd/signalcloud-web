# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

gem 'haml'
gem 'maruku'

include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering

module ToolKitHelper
  def self.logo
    "<span class='logo'><i class='icon-cloud'></i><i class=icon-bolt'></i></span>"
  end
  
  def self.icon_stack( base, top )
    "<span class='icon-stack'><i class='icon-#{base} icon-stack-base'></i><i class='icon-#{top} icon-stack-top'></i></span>"
  end
  
  def self.number_icon( number, base='circle' )
    "<span class='icon-stack'><i class='icon-#{base} icon-stack-base'></i><i class='icon-stack-top'>#{number}</i></span>"
  end
end

def icon_stack( base, top, top2=nil )
  top_icon = top2 ? "<i class='icon-#{top2} icon-stack-top2'></i>" : ''
  "<span class='icon-stack'><i class='icon-#{base} icon-stack-base'></i><i class='icon-#{top} icon-stack-top'></i>#{top_icon}</span>"
end

def number_icon( number, base='circle' )
  "<span class='icon-stack'><i class='icon-#{base} icon-stack-base'></i><i class='icon-stack-top'>#{number}</i></span>"
end

def popover( direction=nil, content=nil )
  "<div class='popover #{direction}'><div class='arrow'></div><div class='popover-content'>#{content}</div></div>"
end
