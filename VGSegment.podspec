Pod::Spec.new do |s|

# Guide: https://github.com/VeinGuo/VGSegment

  s.name         = "VGSegment"
  s.version      = "1.0.4"
  s.summary      = "A segment menu with line animation"
  s.license      = { :type => 'MIT License', :file => 'LICENSE' }
  s.homepage     = "https://github.com/VeinGuo/VGSegment"
  s.author       = { "VeinGuo" => "https://github.com/VeinGuo" }
  s.ios.deployment_target = "8.0"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/VeinGuo/VGSegment.git", :tag => s.version }
  s.source_files = 'VGSegment/**/*.{h,m,swift}'
  s.requires_arc = true

end

