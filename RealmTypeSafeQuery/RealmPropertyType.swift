//
//  RealmPropertyType.swift
//  RealmTypeSafeQuery
//
//  Created by Kishikawa Katsumi on 2017/09/20.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import Foundation

public protocol RealmPropertyType {
    var _object: AnyObject { get }
}

public protocol RealmEquatablePropertyType: RealmPropertyType {}
public protocol RealmComparablePropertyType: RealmEquatablePropertyType {}

extension Bool: RealmEquatablePropertyType {
    public var _object: AnyObject { return NSNumber(value: self) }
}
extension Int: RealmComparablePropertyType {
    public var _object: AnyObject { return NSNumber(value: self) }
}
extension Int8: RealmComparablePropertyType {
    public var _object: AnyObject { return NSNumber(value: self) }
}
extension Int16: RealmComparablePropertyType {
    public var _object: AnyObject { return NSNumber(value: self) }
}
extension Int32: RealmComparablePropertyType {
    public var _object: AnyObject { return NSNumber(value: self) }
}
extension Int64: RealmComparablePropertyType {
    public var _object: AnyObject { return NSNumber(value: self) }
}
extension Float: RealmComparablePropertyType {
    public var _object: AnyObject { return NSNumber(value: self) }
}
extension Double: RealmComparablePropertyType {
    public var _object: AnyObject { return NSNumber(value: self) }
}
extension Date: RealmComparablePropertyType {
    public var _object: AnyObject { return self as NSDate }
}
extension NSDate: RealmComparablePropertyType {
    public var _object: AnyObject { return self }
}

extension String: RealmEquatablePropertyType {
    public var _object: AnyObject { return self as NSString }
}
extension NSString: RealmEquatablePropertyType {
    public var _object: AnyObject { return self as NSString }
}
extension Data: RealmEquatablePropertyType {
    public var _object: AnyObject { return self as NSData }
}
extension NSData: RealmEquatablePropertyType {
    public var _object: AnyObject { return self }
}
