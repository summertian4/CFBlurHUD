#
#  Be sure to run `pod spec lint CFBlurHUD.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CFBlurHUD"
  s.version      = "1.0.0"
  s.summary      = "A activity indicator with blur effect on iOS."
  s.homepage     = "https://github.com/summertian4/CFBlurHUD"

  s.license      = "MIT"

  s.author             = { "周凌宇" => "coderfish@qq.com" }
  # Or just: s.author    = "周凌宇"
  # s.authors            = { "周凌宇" => "coderfish@qq.com" }
  # s.social_media_url   = "http://twitter.com/周凌宇"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/summertian4/CFBlurHUD.git", :tag => "#{s.version}" }

  s.source_files  = "CFBlurHUD/**"

end
