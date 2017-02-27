#
#  Be sure to run `pod spec lint CFBlurBUD.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CFBlurBUD"
  s.version      = "1.0.0"
  s.summary      = "A activity indicator with blur effect on iOS."
  s.homepage     = "https://github.com/summertian4/CFBlurHUD"
  s.screenshots  = "https://github.com/summertian4/CFBlurHUD/blob/master/res/github_iOS-CFBlurHUD-show.gif"


  s.license          = { :type => "MIT", :file => "LICENSE" }
 
  s.author             = { "周凌宇" => "coderfish@qq.com" }

  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/summertian4/CFBlurHUD.git", :tag => s.version.to_s }

  s.source_files  = "CFBlurHUD/**"

end
