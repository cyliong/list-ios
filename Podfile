platform :ios, '10.0'

target 'List' do
  use_frameworks!

  pod 'RealmSwift'
  pod 'RxSwift', '6.0.0-rc.1'
  pod 'RxCocoa', '6.0.0-rc.1'
  pod 'MaterialComponents/Snackbar'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
