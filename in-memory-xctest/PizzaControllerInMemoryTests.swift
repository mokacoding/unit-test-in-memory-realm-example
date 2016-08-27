//
//  in_memory_xctest.swift
//  in-memory-xctest
//
//  Created by Giovanni on 27/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import XCTest
import RealmSwift
import testing_realm

class PizzaControllerTests: XCTestCase {

    var testRealm: Realm!
    var sut: PizzaController!
    
    override func setUp() {
        super.setUp()

        testRealm = try! Realm(
            configuration: Realm.Configuration(inMemoryIdentifier: "pizza-controller-spec")
        )
        sut = PizzaController(realm: testRealm)
    }

    override func tearDown() {
        try! testRealm.write {
            testRealm.deleteAll()
        }

        super.tearDown()
    }

    func testAddsPizzaToRealm() {
        let existingCount = testRealm.objects(Pizza).count
        XCTAssertEqual(existingCount, 0)

        let p = Pizza()
        p.name = "Margherita"
        sut.addPizza(p)

        XCTAssertEqual(testRealm.objects(Pizza).count, 1)
    }
}
