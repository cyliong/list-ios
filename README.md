# list-ios
This is a simple list mobile app (to-do list, tasks, shopping list, recipes, and the like) showcasing the implementation of CRUD operations, MVVM pattern and reactive programming, written in Swift for the iOS platform.

Together with [list-android](https://github.com/cyliong/list-android), they present a way to develop cross-platform native mobile apps with similar patterns and libraries. In addition, BDD-style test automation for both the Android and iOS list apps is showcased at [cross-platform-bdd](https://github.com/cyliong/cross-platform-bdd).

## Features
- Display a list of items (`UITableViewController`, Realm `Results`)
- Navigate to a page to add or edit items (`UINavigationController`, segue, `UITextField`)
- Reactively enable or disable save button upon text changes (`RxSwift`)
- Swipe to delete items (`tableView(_:commit:forRowAt:)`)
- Store items in database using data model (Realm `Object`)

## Dependencies
- Realm Database
- RxSwift

## Requirements
- Xcode 10.2 or higher
- Cocoapods 1.7.0 or higher
- iOS 9.3 or higher
- Swift 5 or higher

## Setup
1. Open **Terminal** and navigate to your project directory by using the `cd` command.
2. Run `pod install` command.
3. Open `List.xcworkspace` in Xcode.
