#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint castle.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'castle'
  s.version          = '0.0.1'
  s.summary          = 'Castle flutter plugin.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://castle.io'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Castle Intelligence' => 'team@castle.io' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.dependency 'Castle', '1.0.7'
end
