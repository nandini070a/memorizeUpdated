//
//  MemorizeTests.swift
//  MemorizeTests
//
//  Created by Nandini Saha on 2022-09-03.
//

import XCTest
@testable import Memorize
import SwiftUI

class MemorizeTests: XCTestCase {
    
    var viewModel: MemoryGameViewModel!
    
    override func setUpWithError() throws {
        viewModel = MemoryGameViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testNumberOfEmojis() {
        let actual = MemoryGameViewModel.emojis.count
        let expected = 24
        XCTAssertEqual(actual, expected)
    }
    
    func testChooseCardWithFaceUpTrue() {
        viewModel.choose(viewModel.cards[0])
        XCTAssertTrue(viewModel.cards[0].isFaceUp)
        
    }
    
    func testChooseCardIsMatchedTrue() {
        viewModel.choose(viewModel.cards[0])
        viewModel.choose(viewModel.cards[1])
        XCTAssertTrue(viewModel.cards[0].isMatched)
        XCTAssertTrue(viewModel.cards[1].isMatched)    }

    
    func testIfAllCardsFaceDownWhenThirdCardIsChosen() {
        viewModel.choose(viewModel.cards[2])
        viewModel.choose(viewModel.cards[3])
        viewModel.choose(viewModel.cards[4])
        XCTAssertTrue(!viewModel.cards[2].isFaceUp)
        XCTAssertTrue(!viewModel.cards[3].isFaceUp)
        XCTAssertTrue(viewModel.cards[4].isFaceUp)
        XCTAssertTrue(!viewModel.cards[5].isFaceUp)
        XCTAssertTrue(!viewModel.cards[6].isFaceUp)    }
 
    
    func testContentOfFirstCard() {
        viewModel.choose(viewModel.cards[6])
        XCTAssertTrue(viewModel.cards[6].content == "⛴")
    }
}
