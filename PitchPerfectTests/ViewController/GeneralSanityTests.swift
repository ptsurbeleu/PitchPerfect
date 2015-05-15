//
//  GeneralSanityTests.swift
//  PitchPerfect
//
//  Created by Pavel Tsurbeleu on 5/14/15.
//  Copyright (c) 2015 Pavel Tsurbeleu. All rights reserved.
//

import PitchPerfect
import UIKit
import XCTest

class GeneralSanityTests: XCTestCase {
    
    // Validates the 'Stop' button outlet is connected to the actual control.
    func testControllerHasExpectedTitle() {
        // Arrange
        let expected = "Record"
        var actual: String?
        
        // Act
        self.act() { (c: ViewController) in
            actual = c.title
        }
        
        // Assert
        XCTAssert(expected == actual, "Fail => expected: '\(expected)' vs. actual: '\(actual)'")
    }
    
    // Validates the 'Stop' button outlet is connected to the actual control.
    func testStopButtonOutletIsConnected() {
        // Arrange
        var actual: UIButton?
        
        // Act
        self.act() { (c: ViewController) in
            actual = c.stopButton
        }
        
        // Assert
        XCTAssert(actual != nil, "Assertion failed since stopButton outlet is not connected to the view")
    }
    
    
    // Validates the 'Record' button outlet is connected to the actual control.
    func testRecordButtonOutletIsConnected() {
        // Arrange
        var actual: UIButton?
        
        // Act
        self.act() { (c: ViewController) in
            actual = c.recordButton
        }
        
        // Assert
        XCTAssert(actual != nil, "Assertion failed since recordButton outlet is not connected to the view")
    }
    
    // Validates the label outlet is connected to the actual control.
    func testRecorderStateOutletIsConnected() {
        // Arrange
        var actual: UILabel?
        
        // Act
        self.act() { (c: ViewController) in
            actual = c.recorderState
        }
        
        // Assert
        XCTAssert(actual != nil, "Assertion failed since recorderState outlet is not connected to the view")
    }

    func act(testSpy: ViewControllerSpy) {
        executeSpy(testSpy)
    }
    
}


func executeSpy(testSpy: ViewControllerSpy) {
    // This snippet has been borrowed from TheMovieDB project [link & credits of the author go here]
    let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    let controller = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
    
    // This snippet has been borrowed from Johan Williams's blog post, see the link: http://bit.ly/1JY63xI
    controller.loadView()
    
    // Let the unit test code analyze the controller's state
    testSpy(controller)
}