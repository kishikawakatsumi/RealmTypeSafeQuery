//
//  Predicate.swift
//  RealmTypeSafeQuery
//
//  Created by Kishikawa Katsumi on 2017/09/20.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import Foundation

public protocol Predicate {
    associatedtype ObjectType
    var predicate: NSPredicate { get }
}

public struct BasicPredicate<RealmObject>: Predicate {
    public typealias ObjectType = RealmObject

    let format: String
    let arguments: [AnyObject]

    public var predicate: NSPredicate {
        return NSPredicate(format: format, argumentArray: arguments)
    }
}

public struct AndPredicate<RealmObject>: Predicate {
    public typealias ObjectType = RealmObject

    let left: BasicPredicate<RealmObject>
    let right: BasicPredicate<RealmObject>

    public var predicate: NSPredicate {
        return NSCompoundPredicate(type: .and, subpredicates: [left.predicate, right.predicate])
    }
}

public struct OrPredicate<RealmObject>: Predicate {
    public typealias ObjectType = RealmObject

    let left: BasicPredicate<RealmObject>
    let right: BasicPredicate<RealmObject>

    public var predicate: NSPredicate {
        return NSCompoundPredicate(type: .or, subpredicates: [left.predicate, right.predicate])
    }
}

public struct NotPredicate<RealmObject>: Predicate {
    public typealias ObjectType = RealmObject

    let original: BasicPredicate<RealmObject>

    public var predicate: NSPredicate {
        return NSCompoundPredicate(notPredicateWithSubpredicate: original.predicate)
    }
}
