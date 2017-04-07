Pod::Spec.new do |s|
s.name         = "afn"
  s.version      = "1.0.0"
  s.summary      = "all kinds of categories for iOS afn"
  #s.description  = <<-DESC
  #DESC
  s.homepage    =   "https://github.com/bertGao/afn/bert"
  s.license      = { :type => “MIT”, :file => “LICENSE”}
   s.author             = {"高祥"=>"1243939103@qq.com"}
   s.source       = { :git => "https://github.com/bertGao/afn.git”, :tag => "#{s.version}" }
s.source_files="Classes", "af/Classes/**/*.{h,m}"
s.exclude_files="Classes/Exclude"
end
