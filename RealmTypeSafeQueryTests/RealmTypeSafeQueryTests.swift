//
//  RealmTypeSafeQueryTests.swift
//  RealmTypeSafeQueryTests
//
//  Created by Kishikawa Katsumi on 2017/09/20.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import XCTest
import RealmSwift
@testable import RealmTypeSafeQuery

class RealmTypeSafeQueryTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNonOptionalProperties() {
        let configuration = Realm.Configuration(inMemoryIdentifier: "test")
        let realm = try! Realm(configuration: configuration)

        try! realm.write {
            realm.create(SwiftObject.self, value: [
                "boolCol": true,
                "intCol": 1,
                "floatCol": 1.1 as Float,
                "doubleCol": 11.1,
                "stringCol": "a",
                "binaryCol": "a".data(using: String.Encoding.utf8)!,
                "dateCol": Date(timeIntervalSince1970: 1),
                "objectCol": SwiftBoolObject(value: [true]),
                "arrayCol": [SwiftBoolObject(value: [true]), SwiftBoolObject(value: [false])]
                ])
            realm.create(SwiftObject.self, value: [
                "boolCol": false,
                "intCol": 2,
                "floatCol": 2.2 as Float,
                "doubleCol": 22.2,
                "stringCol": "b",
                "binaryCol": "b".data(using: .utf8)!,
                "dateCol": Date(timeIntervalSince1970: 2),
                "objectCol": SwiftBoolObject(value: [false]),
                "arrayCol": [SwiftBoolObject(value: [false]), SwiftBoolObject(value: [true])]
                ])
            realm.create(SwiftObject.self, value: [
                "boolCol": false,
                "intCol": 3,
                "floatCol": 3.3 as Float,
                "doubleCol": 33.3,
                "stringCol": "c",
                "binaryCol": "c".data(using: .utf8)!,
                "dateCol": Date(timeIntervalSince1970: 3),
                "objectCol": SwiftBoolObject(value: [false]),
                "arrayCol": [SwiftBoolObject(value: [false]), SwiftBoolObject(value: [true])]
                ])
        }

        XCTAssertEqual(realm.objects(SwiftObject.self).count, 3)

        // Comparison operators
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.boolCol == true).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.boolCol != true).count, 2)

        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.intCol == 1).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.intCol != 1).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.intCol < 3).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.intCol <= 3).count, 3)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.intCol > 1).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.intCol >= 1).count, 3)

        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.floatCol == 1.1).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.floatCol != 1.1).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.floatCol < 3.3).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.floatCol <= 3.3).count, 3)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.floatCol > 1.1).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.floatCol >= 1.1).count, 3)

        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.doubleCol == 11.1).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.doubleCol != 11.1).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.doubleCol < 33.3).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.doubleCol <= 33.3).count, 3)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.doubleCol > 11.1).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.doubleCol >= 11.1).count, 3)

        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.stringCol == "a").count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.stringCol != "a").count, 2)

        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.binaryCol == "a".data(using: .utf8)!).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.binaryCol != "a".data(using: .utf8)!).count, 2)

        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.dateCol == Date(timeIntervalSince1970: 1)).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.dateCol != Date(timeIntervalSince1970: 1)).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.dateCol < Date(timeIntervalSince1970: 3)).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.dateCol <= Date(timeIntervalSince1970: 3)).count, 3)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.dateCol > Date(timeIntervalSince1970: 1)).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.dateCol >= Date(timeIntervalSince1970: 1)).count, 3)

        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.objectCol == SwiftBoolObject()).count, 0)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.objectCol != SwiftBoolObject()).count, 3)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.objectCol?.boolCol == true).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.objectCol?.boolCol != true).count, 2)

        // Logical operators
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.stringCol == "a" && \SwiftObject.intCol == 1).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.stringCol == "a" && \SwiftObject.intCol == 1).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.stringCol == "a" && \SwiftObject.intCol == 2).count, 0)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.stringCol == "a" || \SwiftObject.intCol == 1).count, 1)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(\SwiftObject.stringCol == "a" || \SwiftObject.intCol == 2).count, 2)
        XCTAssertEqual(realm.objects(SwiftObject.self).filter(!(\SwiftObject.stringCol == "a")).count, 2)

        // Sorting
        XCTAssertEqual(realm.objects(SwiftObject.self).sorted(byKeyPath: \SwiftObject.stringCol, ascending: true)[0].stringCol, "a")
        XCTAssertEqual(realm.objects(SwiftObject.self).sorted(byKeyPath: \SwiftObject.stringCol, ascending: false)[0].stringCol, "c")
    }

    func testOptionalProperties() {

        let configuration = Realm.Configuration(inMemoryIdentifier: "test")
        let realm = try! Realm(configuration: configuration)

        try! realm.write {
            realm.create(SwiftOptionalObject.self, value: [
                "optNSStringCol": "a",
                "optStringCol": "a",
                "optBinaryCol": "a".data(using: .utf8)!,
                "optDateCol": Date(timeIntervalSince1970: 1),
                "optIntCol": 1,
                "optFloatCol": 1.1 as Float,
                "optDoubleCol": 11.1,
                "optBoolCol": true,
                "optObjectCol": SwiftBoolObject(value: [true])
                ])
            realm.create(SwiftOptionalObject.self, value: [
                "optNSStringCol": "b",
                "optStringCol": "b",
                "optBinaryCol": "b".data(using: .utf8)!,
                "optDateCol": Date(timeIntervalSince1970: 2),
                "optIntCol": 2,
                "optFloatCol": 2.2 as Float,
                "optDoubleCol": 22.12,
                "optBoolCol": false,
                "optObjectCol": SwiftBoolObject(value: [false])
                ])
            realm.create(SwiftOptionalObject.self)
        }

        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).count, 3)

        // Comparison operators
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optNSStringCol == "a").count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optNSStringCol != "a").count, 2)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optNSStringCol == nil).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optNSStringCol != nil).count, 2)

        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optStringCol == "a").count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optStringCol != "a").count, 2)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optStringCol == nil).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optStringCol != nil).count, 2)

        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optBinaryCol == "a".data(using: .utf8)!).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optBinaryCol != "a".data(using: .utf8)!).count, 2)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optBinaryCol == nil).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optBinaryCol != nil).count, 2)

        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol == Date(timeIntervalSince1970: 1)).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol != Date(timeIntervalSince1970: 1)).count, 2)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol == nil).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol != nil).count, 2)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol < Date(timeIntervalSince1970: 2)).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol <= Date(timeIntervalSince1970: 2)).count, 2)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol > Date(timeIntervalSince1970: 1)).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol >= Date(timeIntervalSince1970: 1)).count, 2)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol < nil).count, 0)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol <= nil).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol > nil).count, 0)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optDateCol >= nil).count, 1)

        // RealmOptional<T> KeyPath cannot work because `_kvcKeyPathString` returns `nil` if non-objc property
        /*
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optIntCol == 1).count, 1)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optIntCol != 1).count, 2)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optIntCol == nil).count, 1)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optIntCol != nil).count, 2)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optIntCol < 2).count, 1)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optIntCol <= 2).count, 2)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optIntCol > 1).count, 1)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optIntCol >= 1).count, 2)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optBoolCol == true).count, 1)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optBoolCol != true).count, 2)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optBoolCol == nil).count, 1)
         XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optBoolCol != nil).count, 2)
         */

        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optObjectCol == SwiftBoolObject()).count, 0)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optObjectCol != SwiftBoolObject()).count, 3)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optObjectCol == nil).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optObjectCol != nil).count, 2)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optObjectCol?.boolCol == true).count, 1)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).filter(\SwiftOptionalObject.optObjectCol?.boolCol != true).count, 2)

        // Sorting
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).sorted(byKeyPath: \SwiftOptionalObject.optStringCol, ascending: true)[0].optStringCol, nil)
        XCTAssertEqual(realm.objects(SwiftOptionalObject.self).sorted(byKeyPath: \SwiftOptionalObject.optStringCol, ascending: false)[0].optStringCol, "b")
    }
}
