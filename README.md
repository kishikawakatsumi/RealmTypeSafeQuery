# RealmSafeQuery

A type-safe Realm query extensions using Swift 4's Smart KeyPaths.

## Requirements
RealmSafeQuery is written in Swift 4.

## Installation

### CocoaPods
RealmSafeQuery is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RealmSafeQuery'
```

### Carthage
For [Carthage](https://github.com/Carthage/Carthage), add the following to your `Cartfile`:

```ogdl
github "kishikawakatsumi/RealmSafeQuery"
```

## Description

RealmSafeQuery provides type safety, code completion and avoidance of typos against `NSPredicate` queries.

### Before

```swift
realm.objects(Person.self).filter("name == %@", "Katsumi")
realm.objects(Person.self).filter("age > %@", 20)
```

### After

```swift
realm.objects(Person.self).filter(\Person.name == "Katsumi")
realm.objects(Person.self).filter(\Person.age > 20)
```

The following code should be a compile error.

```swift
realm.objects(Person.self).filter(\Person.name > 20) // Compile error
realm.objects(Person.self).filter(\Dog.name == "John") // Compile error
```

### Feature request for Swift Standard Library

It requires a string representation of `KeyPath` to construct `NSPredicate` from `KeyPath`. However, the API is not officially visible currently. The feature request is tracked at [SR-5220](https://bugs.swift.org/browse/SR-5220).

[[SR-5220] Expose API to retrieve string representation of KeyPath - Swift](https://bugs.swift.org/browse/SR-5220)
