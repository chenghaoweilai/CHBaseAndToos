#
#  Be sure to run `pod spec lint CHBaseAndToos.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "CHBaseAndToos"
  spec.version      = "0.0.1"
  spec.summary      = "Toos Module"
  spec.description  = <<-DESC
			Some commonly used tools
                   DESC

  spec.homepage     = "https://github.com/chenghaoweilai/CHBaseAndToos/"
  spec.license      = "MIT"
  spec.author       = { "ChengHao" => "chenghaoweilai@163.com" }
  spec.source       = { :git => "https://github.com/chenghaoweilai/CHBaseAndToos.git", :tag => "#{spec.version}" }
  spec.platform     = :ios, '8.0'

  spec.source_files  = "CHBaseAndToos/*.{h,m}"
  spec.frameworks = 'QuartzCore','UIKit'  

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
