Pod::Spec.new do |s|
    s.name             = 'DGSnackBar'
    s.version          = '1.0.0'
    s.summary          = 'SnackBar that responds to the keyboard and shows a message at the bottom of the screen.'
    s.homepage         = 'https://github.com/donggyushin/DGSnackBar'
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'donggyushin' => 'donggyu9410@gmail.com' }
    s.source           = { :git => 'https://github.com/donggyushin/DGSnackBar.git', :tag => s.version.to_s }
    s.ios.deployment_target = '13.0'
    s.swift_version = '5.0'
    s.source_files = 'Sources/DGSnackBar/**/*'
  end