//
//  Operators.swift
//  RealmTypeSafeQuery
//
//  Created by Kishikawa Katsumi on 2017/09/20.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: Logical Operators
public func && <RealmObject: Object>(lhs: BasicPredicate<RealmObject>, rhs: BasicPredicate<RealmObject>) -> AndPredicate<RealmObject> {
    return AndPredicate(left: lhs, right: rhs)
}

public func || <RealmObject: Object>(lhs: BasicPredicate<RealmObject>, rhs: BasicPredicate<RealmObject>) -> OrPredicate<RealmObject> {
    return OrPredicate(left: lhs, right: rhs)
}

public prefix func ! <RealmObject: Object>(predicate: BasicPredicate<RealmObject>) -> NotPredicate<RealmObject> {
    return NotPredicate(original: predicate)
}

// MARK: RealmEquatablePropertyType

public func == <RealmObject: Object, RealmProperty: RealmEquatablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty>, rhs: RealmProperty) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K == %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs._object])
}

public func != <RealmObject: Object, RealmProperty: RealmEquatablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty>, rhs: RealmProperty) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K != %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs._object])
}

// MARK: Optional<RealmEquatablePropertyType>
public func == <RealmObject: Object, RealmProperty: RealmEquatablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty?>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K == %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
}

public func != <RealmObject: Object, RealmProperty: RealmEquatablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty?>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K != %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
}

// `_kvcKeyPathString` returns `nil` if non-objc property
/*
 // MARK: RealmOptional<RealmEquatablePropertyType>
 public func == <RealmObject: Object, RealmProperty: RealmEquatablePropertyType>(lhs: KeyPath<RealmObject, RealmOptional<RealmProperty>>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
 return BasicPredicate<RealmObject>(format: "%K == %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
 }

 public func != <RealmObject: Object, RealmProperty: RealmEquatablePropertyType>(lhs: KeyPath<RealmObject, RealmOptional<RealmProperty>>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
 return BasicPredicate<RealmObject>(format: "%K != %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
 }
 */

// MARK: RealmComparablePropertyType
public func < <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty>, rhs: RealmProperty) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K < %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs._object])
}

public func > <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty>, rhs: RealmProperty) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K > %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs._object])
}

public func <= <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty>, rhs: RealmProperty) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K <= %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs._object])
}

public func >= <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty>, rhs: RealmProperty) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K >= %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs._object])
}

// MARK: Optional<RealmComparablePropertyType>
public func < <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty?>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K < %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
}

public func > <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty?>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K > %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
}
public func <= <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty?>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K <= %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
}

public func >= <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmProperty?>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K >= %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
}

// `_kvcKeyPathString` returns `nil` if non-objc property
/*
 // MARK: RealmOptional<RealmComparablePropertyType>
 public func < <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmOptional<RealmProperty>>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
 return BasicPredicate<RealmObject>(format: "%K < %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
 }

 public func > <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmOptional<RealmProperty>>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
 return BasicPredicate<RealmObject>(format: "%K > %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
 }
 public func <= <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmOptional<RealmProperty>>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
 return BasicPredicate<RealmObject>(format: "%K <= %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
 }

 public func >= <RealmObject: Object, RealmProperty: RealmComparablePropertyType>(lhs: KeyPath<RealmObject, RealmOptional<RealmProperty>>, rhs: RealmProperty?) -> BasicPredicate<RealmObject> {
 return BasicPredicate<RealmObject>(format: "%K >= %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs?._object ?? NSNull()])
 }
 */

// MARK: Object
public func == <RealmObject: Object, RelationObject: Object>(lhs: KeyPath<RealmObject, RelationObject?>, rhs: RelationObject?) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K == %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs ?? NSNull()])
}

public func != <RealmObject: Object, RelationObject: Object>(lhs: KeyPath<RealmObject, RelationObject?>, rhs: RelationObject?) -> BasicPredicate<RealmObject> {
    return BasicPredicate<RealmObject>(format: "%K != %@", arguments: [lhs._kvcKeyPathString! as NSString, rhs ?? NSNull()])
}
