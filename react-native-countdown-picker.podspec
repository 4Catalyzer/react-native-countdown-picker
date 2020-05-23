require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = "MIT"

  s.authors      = package['author']
  s.homepage     = "https://github.com/4Catalyzer/react-native-countdown-picker"
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/4Catalyzer/react-native-countdown-picker.git", :tag => "v#{s.version}" }
  s.source_files  = "CJCountDownPicker/**/*.{h,m}"

  s.dependency 'React'
  s.dependency 'ActionSheetPicker-3.0', '2.5.0'
end
