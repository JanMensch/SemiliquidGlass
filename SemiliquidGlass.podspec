Pod::Spec.new do |s|
  s.name             = 'SemiliquidGlass'
  s.version          = '1.0.2'
  s.summary          = 'Use Liquid Glass comfortably without raising your deployment target.'
  s.description      = <<-DESC
Use Liquid Glass without availability checks and without raising your deployment target. Add easy fallbacks for OSs without Liquid Glass.
                       DESC

  s.homepage         = 'https://github.com/JanMensch/SemiliquidGlass'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JanMensch' => 'jan@mensch.app' }
  s.source           = { :git => 'https://github.com/JanMensch/SemiliquidGlass.git', :tag => s.version.to_s }

  s.ios.deployment_target = '17.0'
  s.osx.deployment_target  = '14.0'

  s.swift_version = '6.2'
  s.source_files = 'Sources/**/*'
  s.frameworks = 'SwiftUI'
end
