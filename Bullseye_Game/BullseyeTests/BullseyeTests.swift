//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Anthony Carrasco on 10/7/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
    }
    
    func testExample() throws {
        XCTAssertEqual(game.points(sliderValue: 50), 999)
    }
    
}
