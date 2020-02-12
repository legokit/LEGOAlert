#
# Be sure to run `pod lib lint LEGOAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LEGOAlert'
  s.version          = '0.1.0'
  s.summary          = 'The view interaction box component can use prompt box, inquiry box, attributed string box, image-text box, textField box, textView box, and custom box, and more support content scrolling, horizontal and vertical screen adaptation, and height customization. 视图交互框组件，可以使用提示框、询问框、富文本框、图文框、输入框、文本框、自定义框，更支持内容滚动、横竖屏适配、高度自定义。'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/legokit/LEGOAlert'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '564008993@qq.com' => '564008993@qq.com' }
  s.source           = { :git => 'https://github.com/legokit/LEGOAlert.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LEGOAlert/Classes/**/*'
  s.resource = 'LEGOAlert/Assets/*.bundle'
  s.dependency 'Masonry'
  
  # s.resource_bundles = {
  #   'LEGOAlert' => ['LEGOAlert/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
