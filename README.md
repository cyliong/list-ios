# list-ios
This is a simple list mobile app (to-do list, tasks, shopping list, recipes, and the like) 
showcasing the implementation of CRUD operations, written in Swift for the iOS platform.

This project, together with [list-android](https://github.com/cyliong/list-android), 
present a way to develop cross-platform native mobile apps with similar patterns and libraries, including:
- MVVM pattern
- Reactive programming
- Material Components
- Realm

In addition, BDD-style test automation for both the Android and iOS list apps is showcased at 
[cross-platform-bdd](https://github.com/cyliong/cross-platform-bdd).

*If you are looking for a more iOS-specific solution without concerning
too much about reusing similar patterns and libraries across platforms,
may refer to the [list2-ios](https://github.com/cyliong/list2-ios) project.*

## Features
- Display a list of items (`UITableViewController`, Realm `Results`)
- Navigate to a page to add or edit items (`UINavigationController`, segue, `UITextField`)
- Reactively enable or disable save button upon text changes (`RxSwift`)
- Swipe to delete items (`tableView(_:commit:forRowAt:)`)
- Store items in database using data model (Realm `Object`)

## Dependencies
- Realm Database
- RxSwift
- Material Components

## Requirements
- Xcode 12.1 or higher
- CocoaPods 1.10.0 or higher
- iOS 10.0 or higher
- Swift 5 or higher

## Setup
1. Open **Terminal** and navigate to your project directory by using the `cd` command.
2. Run `pod install` command.
3. Open `List.xcworkspace` in Xcode.
