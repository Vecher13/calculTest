//
//  calculTestTests.swift
//  calculTestTests
//
//  Created by Ash on 29.05.2021.
//

import XCTest
@testable import calculTest

class calculTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testAdd(){
        let calculator = ViewController()
       let res = calculator.addCulc(first: 5, second: 7)
        XCTAssertEqual(res, 12)
    }
    func testSubstract(){
        let calculator = ViewController()
        let res = calculator.substract(first: 13, second: 3)
        XCTAssertEqual(res, 10)
    }
    func testMulti(){
        let calculator = ViewController()
        let res = calculator.multiply(first: 3, second: 7)
        XCTAssertEqual(res, 21)
    }
    func testDivide(){
        let calculator = ViewController()
        let res = calculator.divide(first: 10, second: 2)
        XCTAssertEqual(res, 5)
    }
    
    func testExample() throws {
       
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
