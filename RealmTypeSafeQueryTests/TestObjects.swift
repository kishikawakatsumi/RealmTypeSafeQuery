//
//  TestObjects.swift
//  RealmTypeSafeQueryTests
//
//  Created by Kishikawa Katsumi on 2017/09/20.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import Foundation
import RealmSwift

class SwiftObject: Object {
    @objc dynamic var boolCol = false
    @objc dynamic var intCol = 123
    @objc dynamic var floatCol = 1.23 as Float
    @objc dynamic var doubleCol = 12.3
    @objc dynamic var stringCol = "a"
    @objc dynamic var binaryCol = "a".data(using: String.Encoding.utf8)!
    @objc dynamic var dateCol = Date(timeIntervalSince1970: 1)
    @objc dynamic var objectCol: SwiftBoolObject? = SwiftBoolObject()
    let arrayCol = List<SwiftBoolObject>()

    class func defaultValues() -> [String: Any] {
        return  [
            "boolCol": false,
            "intCol": 123,
            "floatCol": 1.23 as Float,
            "doubleCol": 12.3,
            "stringCol": "a",
            "binaryCol": "a".data(using: String.Encoding.utf8)!,
            "dateCol": Date(timeIntervalSince1970: 1),
            "objectCol": [false],
            "arrayCol": []
        ]
    }
}

class SwiftOptionalObject: Object {
    @objc dynamic var optNSStringCol: NSString?
    @objc dynamic var optStringCol: String?
    @objc dynamic var optBinaryCol: Data?
    @objc dynamic var optDateCol: Date?
    let optIntCol = RealmOptional<Int>()
    let optInt8Col = RealmOptional<Int8>()
    let optInt16Col = RealmOptional<Int16>()
    let optInt32Col = RealmOptional<Int32>()
    let optInt64Col = RealmOptional<Int64>()
    let optFloatCol = RealmOptional<Float>()
    let optDoubleCol = RealmOptional<Double>()
    let optBoolCol = RealmOptional<Bool>()
    @objc dynamic var optObjectCol: SwiftBoolObject?
}

class SwiftBoolObject: Object {
    @objc dynamic var boolCol = false
}
