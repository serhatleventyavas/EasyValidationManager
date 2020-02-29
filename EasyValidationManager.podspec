Pod::Spec.new do |spec|
  spec.name         = "EasyValidationManager"
  spec.version      = "1.0.1"
  spec.summary      = "EasyValidationManager is a small validation library."
  spec.description  = <<-DESC
  EasyValidationManager library allow to us that check phone number, credit card, email easily."
                   DESC
  spec.homepage     = "https://github.com/serhatleventyavas/EasyValidationManager.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Serhat Levent Yavaş" => "serhatleventyavas@gmail.com" }
  spec.ios.deployment_target = "12.1"
  spec.swift_versions = "4.2"
  spec.source       = { :git => "https://github.com/serhatleventyavas/EasyValidationManager.git", :tag => "#{spec.version}" }
  spec.source_files  = "EasyValidationManager/**/*.{h,m,swift}"
end
