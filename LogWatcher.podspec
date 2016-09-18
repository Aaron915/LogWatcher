#
#  Be sure to run `pod spec lint LogWatcher.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LogWatcher"
  s.version      = "0.2"
  s.homepage     = "www.gydorunning.com"
  s.summary      = "Simple framework to aggegrate log statements together."
  s.license      = "MIT"
  s.author             = { "Aaron Williams" => "aaronwilliams9152@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Aaron915/LogWatcher.git", :tag => "0.1.1" }
  s.source_files  = "LogWatcher", "LogWatcher/**/*.{h,m}"

end
