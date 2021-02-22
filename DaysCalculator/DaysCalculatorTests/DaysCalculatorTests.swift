//
//  DaysCalculatorTests.swift
//  DaysCalculatorTests
//
//  Created by Alam, Sk on 22/02/2021.
//  Copyright © 2021 AlamShaikh. All rights reserved.
//

import XCTest
@testable import DaysCalculator

class DaysCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
     
    
    // normal format
    func testIfDateisValidforNormalFormat(){
        let dateString = "01/01/2020"
        let isValid = Utility.isValidDate(dateString)
        XCTAssertTrue(isValid == true)
    }
    // Single format
       func testIfDateisValidforSingleDigit(){
           let dateString = "1/1/2020"
           let isValid = Utility.isValidDate(dateString)
           XCTAssertTrue(isValid == true)
       }
    // day Single format
    func testIfDateisValidforSingleDigitDay(){
        let dateString = "1/01/2020"
        let isValid = Utility.isValidDate(dateString)
        XCTAssertTrue(isValid == true)
    }
    // month Single format
       func testIfDateisValidforSingleDigitMonth(){
           let dateString = "01/1/2020"
           let isValid = Utility.isValidDate(dateString)
           XCTAssertTrue(isValid == true)
       }
    // Invalid Single format
    func testIfDateisInValidForNormal(){
        let dateString = "01//1/2020"
        let isValid = Utility.isValidDate(dateString)
        XCTAssertTrue(isValid == false)
    }
    // Invalid Date String
    func testIfDateisInValidifDateisNotANumber(){
        let dateString = "rr/1/2020"
        let isValid = Utility.isValidDate(dateString)
        XCTAssertTrue(isValid == false)
    }
    // Invalid Date String
       func testDateisInValidifDateisNotADateFormat(){
           let dateString = "abcd"
           let isValid = Utility.isValidDate(dateString)
           XCTAssertTrue(isValid == false)
       }
    // 1 day test
    func testNoOfDays1(){
        let startDate = "01/01/2021"
        let endDate = "02/01/2021"
        let result = DateValidator.getDays(fromDate: startDate, toDate: endDate)
        XCTAssertTrue(result.2 == 1)
        
    }
    // 1 month test
    func testNoOfMonths1(){
           let startDate = "01/01/2021"
           let endDate = "01/02/2021"
           let result = DateValidator.getDays(fromDate: startDate, toDate: endDate)
           XCTAssertTrue(result.1 == 1)
           
       }
    // 1 year test
    func testNoOfYears(){
           let startDate = "01/01/2021"
           let endDate = "01/01/2022"
           let result = DateValidator.getDays(fromDate: startDate, toDate: endDate)
           XCTAssertTrue(result.1 == 1)
           
       }
    
    // 1day 1 month and 1 year test
    func testNoOfDayMonthYear(){
           let startDate = "01/01/2021"
           let endDate = "02/02/2022"
           let result = DateValidator.getDays(fromDate: startDate, toDate: endDate)
           XCTAssertTrue(result.0 == 1 && result.1 == 1 && result.2 == 1)
       }
}
