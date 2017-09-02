#
# Be sure to run `pod lib lint RKPieChart.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RKPieChart'
  s.version          = '0.1.0'
  s.summary          = 'Create super easy pie charts with RKPieChart!'

  s.description      = <<-DESC
RKPieChart creates pie charts in super easy way for you. You can divide your pie chart if you want. You can add custom titles for your divided pies and etc.
                       DESC

  s.homepage         = 'https://github.com/ridvank/RKPieChart'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ridvank' => 'ridvankuccuk@gmail.com' }
  s.source           = { :git => 'https://github.com/ridvank/RKPieChart.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://www.linkedin.com/in/rıdvan-küçük-a6598593'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RKPieChart/Classes/**/*'

end
