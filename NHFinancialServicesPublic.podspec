Pod::Spec.new do |s|

    #库名称
    s.name             = 'NHFinancialServicesPublic'   
    #版本号
    s.version          = '1.0.1'
    #库简短介绍,以后search到简介
    s.summary          = 'iOS 测试库组件'
    #开源库描述,定义具体的描述
    s.description      = <<-DESC
   			 TODO: 这是一个Cocoapods制作自己的共有库的测试版本、
  			 DESC
    #开源库地址，或者是博客、社交地址等
    s.homepage      = "https://github.com/TRZhangjie/NHFinancialServicesPublic"
    #开源协议
    s.license       = { :type => 'MIT', :file => 'LICENSE' }
    #开源库GitHub的路径与tag值，GitHub路径后必须有.git,tag实际就是上面的版本
    s.source        = { :git => "https://github.com/TRZhangjie/NHFinancialServicesPublic.git", :tag => "#{s.version}" }
	
    #源库资源文件
    s.source_files  = 'SourceFiles/**/*.{h,m}'  
    s.exclude_files = "Classes/Exclude"


    #build的平台
    s.platform     = :ios, "8.0"
    #最低开发
    s.ios.deployment_target = "8.0"

    #开源库作者
    s.author        = { "" => "" }
    #社交网址
    s.social_media_url = 'https://github.com/TRZhangjie'

    s.dependency 'Masonry', '>= 1.1.0'

end
