# RealmTypeSafeQuery

<p align="center">
    <a href="https://travis-ci.org/kishikawakatsumi/RealmTypeSafeQuery">
        <img src="https://travis-ci.org/kishikawakatsumi/RealmTypeSafeQuery.svg?branch=master&style=flat"
             alt="Build Status">
    </a>
    <a href="https://codecov.io/gh/kishikawakatsumi/RealmTypeSafeQuery">
        <img src="https://codecov.io/gh/kishikawakatsumi/RealmTypeSafeQuery/branch/master/graph/badge.svg" alt="Codecov" />
    </a>
    <a href="https://cocoapods.org/pods/RealmTypeSafeQuery">
        <img src="https://img.shields.io/cocoapods/v/RealmTypeSafeQuery.svg?style=flat"
             alt="Pods Version">
    </a>
    <a href="http://cocoapods.org/pods/RealmTypeSafeQuery/">
        <img src="https://img.shields.io/cocoapods/p/RealmTypeSafeQuery.svg?style=flat"
             alt="Platforms">
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat"
             alt="Carthage Compatible">
    </a>
    <a href="https://swift.org/">
        <img src="https://img.shields.io/badge/Swift-3.x-orange.svg?style=flat"
             alt="Swift 3.x">
    </a>
    <a href="https://swift.org/">
        <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat"
             alt="Swift 4.0">
    </a>
</p>

A type-safe Realm query extensions using Swift 4's Smart KeyPaths.

## Requirements
RealmTypeSafeQuery is written in Swift 4.

## Installation

### CocoaPods
RealmTypeSafeQuery is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RealmTypeSafeQuery'
```

### Carthage
For [Carthage](https://github.com/Carthage/Carthage), add the following to your `Cartfile`:

```ogdl
github "kishikawakatsumi/RealmTypeSafeQuery"
```

## Description

RealmTypeSafeQuery provides type safety, code completion and avoidance of typos against `NSPredicate` queries.

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
