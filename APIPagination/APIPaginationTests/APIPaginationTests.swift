//
//  APIPaginationTests.swift
//  APIPaginationTests
//
//  Created by BA20215448 on 03/05/24.
//

import XCTest
@testable import APIPagination

final class APIPaginationTests: XCTestCase {

    override func setUp() {
        debugPrint("setUp")
        
        let exp = expectation(description: "Test")
        Task {
            await PostViewModel().fetchPosts()
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    override func tearDown() {
        debugPrint("tearDown")
    }
    
    func test_Test() {
        debugPrint("test_Test")
    }
}
