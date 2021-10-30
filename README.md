# list-ios
This is a simple list mobile app 
(to-do list, tasks, shopping list, recipes, and the like) 
showcasing the implementation of CRUD operations, 
written in Swift for the iOS platform.

This project, 
together with [list-android](https://github.com/cyliong/list-android), 
presents a way to develop cross-platform native mobile apps 
with similar patterns and libraries, including:
- MVVM pattern
- Reactive programming
- Material Components
- Realm
- Flutter module

In addition, BDD-style test automation 
for both the Android and iOS list apps is showcased at 
[cross-platform-bdd](https://github.com/cyliong/cross-platform-bdd).

*A Flutter module, [list-module](https://github.com/cyliong/list-module)
is to be integrated into this project to share code written in Dart
across platforms.*

*However, if you are looking for a pure native solution 
without the need to have a single codebase across platforms, refer to 
the [native](https://github.com/cyliong/list-ios/tree/native) branch.*

*Alternatively, if you are looking for a more iOS-specific solution 
without concerning too much about reusing similar patterns 
and libraries across platforms, refer to 
the [list2-ios](https://github.com/cyliong/list2-ios) project.*

## Features
- Display a list of items (`UITableViewController`, Realm `Results`)
- Navigate to a page to add or edit items 
  (`UINavigationController`, segue, `UITextField`)
- Reactively enable or disable save button upon text changes (`RxSwift`)
- Swipe to delete items (`tableView(_:commit:forRowAt:)`)
- Store items in database using data model (Realm `Object`)
- Database migration (`Realm.Configuration`)
- About page (Flutter module)

## Dependencies
- Realm Database
- RxSwift
- Material Components
- Flutter

## Requirements
- Xcode 13.1 or higher
- CocoaPods 1.11.2 or higher
- iOS 10.0 or higher
- Swift 5 or higher

## Setup
1. Download this project (list-ios) and 
   [list-module](https://github.com/cyliong/list-module) 
   then place them in the same directory (e.g. `path/to/`):
```
path/to/
├── list-ios/
└── list-module/
```
2. Run the following to set up list-module:
```
cd path/to/list-module
```
```
flutter pub get
```
3. Run the following to set up list-ios:
```
cd path/to/list-ios
```
```
pod install
```
4. Open `List.xcworkspace` in Xcode and run the app.
