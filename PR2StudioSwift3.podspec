#
# Be sure to run `pod lib lint PR2StudioSwift3.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PR2StudioSwift3'
  s.version          = '0.1.0'
  s.summary          = 'Swift 3 base library used for PR2Studio projects'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
PR2StudioSwift3 is the base library for developing Swift 3 projects. Most of the projects
from PR2Studio uses it.
                       DESC

  s.homepage         = 'https://github.com/pablorocar/PR2StudioSwift3'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = 'MIT'
  s.author           = { "Pablo Roca Rozas" => "pablorocar@gmail.com" }
  s.source           = { :git => 'https://github.com/pablorocar/PR2StudioSwift3.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'PR2StudioSwift3/Classes/**/*'
  s.dependency 'Alamofire', '~> 4.4'
  s.dependency 'AlamofireImage', '~> 3.1'
  s.default_subspec = 'Lite'

  s.subspec 'Lite' do |lite|
  # subspec for users who don't want the third party CryptoSwift
  end

  s.subspec 'Crypto' do |crypto|
    crypto.xcconfig	=
    { 'OTHER_SWIFT_FLAGS' => '$(inherited) -DPR2_OFFER_CRYPTO' }
    crypto.dependency	'CryptoSwift'
    crypto.source_files = 'PR2StudioSwift3/Classes/**/*'
  end

end
