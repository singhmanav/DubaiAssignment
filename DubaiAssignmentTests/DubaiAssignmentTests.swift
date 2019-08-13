//
//  DubaiAssignmentTests.swift
//  DubaiAssignmentTests
//
//  Created by xeadmin on 31/07/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import XCTest
@testable import DubaiAssignment

class DubaiAssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApi(){
        let expectation = self.expectation(description: "Api")
        NetworkManager.sharedNetworkManager.getMostPopularArticles { (articles, error) in
            XCTAssertNotNil(articles)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testVC() {
        let storyboard = UIStoryboard( name: "Main", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "ArticleListViewController") as? ArticleListViewController
        XCTAssertNotNil(rootVC)
        let _ = rootVC!.view // force loading subviews and setting outlets
        rootVC?.viewDidLoad()
        rootVC?.viewWillAppear(false)
        rootVC?.viewDidDisappear(false)
        rootVC?.didReceiveMemoryWarning()
        rootVC?.getMostViewedArticle()
        rootVC?.changePeriod(UIButton())
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
