import XCTest

// SKIP REPLACE: import cows.module.*
import cows

public class TestCows : XCTestCase {
    public func testCows() {
        XCTAssertEqual(1, 1)
        let cow = vaca()
        print(cow)
        // if we could seed the random number generator, we'd be able to test for specific cows
        XCTAssertNotEqual("", cow)
    }
}

