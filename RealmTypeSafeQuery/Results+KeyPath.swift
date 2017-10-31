//
//  Results+KeyPath.swift
//  RealmTypeSafeQuery
//
//  Created by Kishikawa Katsumi on 2017/09/20.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    public func filter<P: Predicate>(_ expression: @autoclosure () -> P) -> Results<Element> where P.ObjectType == Element {
        return filter(expression().predicate)
    }

    public func sorted<RealmObject: Object, RealmProperty: RealmPropertyType>(byKeyPath keyPath: KeyPath<RealmObject, RealmProperty>, ascending: Bool = true) -> Results<Element> {
        return sorted(by: [SortDescriptor(keyPath: keyPath._kvcKeyPathString!, ascending: ascending)])
    }

    public func sorted<RealmObject: Object, RealmProperty: RealmPropertyType>(byKeyPath keyPath: KeyPath<RealmObject, RealmProperty?>, ascending: Bool = true) -> Results<Element> {
        return sorted(by: [SortDescriptor(keyPath: keyPath._kvcKeyPathString!, ascending: ascending)])
    }
}
