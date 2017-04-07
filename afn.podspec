Pod::Spec.new do |s|
s.name         = 'afn'
  s.version      = '1.0.0'
  s.summary      = 'all kinds of categories for iOS afn'
  #s.description  = <<-DESC
  #DESC
  s.homepage    =   'https://github.com/bertGao/afn/bert'
  s.license      = { :type => 'MIT', :file => 'LICENSE'}
   s.author             = {'高祥'=>'1243939103@qq.com'}
   s.source       = { :git => 'https://github.com/bertGao/afn.git', :tag => '1.0.0' }
s.source_files='RootViewController.{h,m}'
s.ios.framework  = 'UIKit'
end
