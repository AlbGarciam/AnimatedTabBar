#
# Be sure to run `pod lib lint AnimatedTabBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AnimatedTabBar'
  s.version          = '0.1.7'
  s.summary          = 'Animated tabbar is Swift UI module framework for adding animations to iOS tabBar items and icons.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
	AnimatedTabBar is a Swift UI module library for adding animation to iOS tabBar items and icons. iOS library made by @AlbGarciam
                       DESC

  s.homepage         = 'https://github.com/AlbGarciam/AnimatedTabBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alb.garciam@gmail.com' => 'alb.garciam@gmail.com' }
  s.source           = { :git => 'https://github.com/AlbGarciam/AnimatedTabBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios
  s.ios.deployment_target = '10.0'
  s.swift_version = '5'

  s.source_files = 'AnimatedTabBar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AnimatedTabBar' => ['AnimatedTabBar/Assets/*.png']
  # }

end
