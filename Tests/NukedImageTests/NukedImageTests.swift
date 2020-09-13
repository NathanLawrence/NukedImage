import XCTest
@testable import NukedImage

final class NukedImageTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NukedImage().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
