platform :ios, '10.0'

flutter_application_path = '../list-module'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'List' do
  use_frameworks!

  install_all_flutter_pods(flutter_application_path)

  pod 'RealmSwift'
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'MaterialComponents/Snackbar'
end
