import XCTest
@testable import NoReMorse

///
/// Translator: https://morsecode.world/international/translator.html
final class NoReMorseTests: XCTestCase {
    
    let m = Morser()
    
    func testMorseToAlpha() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(
            m.translate("- .... . / --.- ..- .. -.-. -.- / -... .-. --- .-- -. / ..-. --- -..- / .--- ..- -- .--. . -.. / --- ...- . .-. / - .... . / .-.. .- --.. -.-- / -.. --- --."),
            "the quick brown fox jumped over the lazy dog"
        )
    }

    static var allTests = [
        ("testMorseToAlpha", testMorseToAlpha),
    ]
}
