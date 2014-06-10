import XCTest

class CharacterSetSpecificationTests: XCTestCase {
	
	func testDigit() {
		let spec = CharacterSetSpecification.decimalDigitCharacterSet()
		XCTAssertTrue(spec.isSatisfiedBy(""))
		XCTAssertTrue(spec.isSatisfiedBy("0123456789"))
		XCTAssertFalse(spec.isSatisfiedBy("0123hello"))
		XCTAssertFalse(spec.isSatisfiedBy("hello"))
	}

	func testWhitespaceAndNewline() {
		let spec = CharacterSetSpecification.whitespaceAndNewlineCharacterSet()
		XCTAssertTrue(spec.isSatisfiedBy(""))
		XCTAssertTrue(spec.isSatisfiedBy(" \t \n "))
		XCTAssertFalse(spec.isSatisfiedBy("---"))
		XCTAssertFalse(spec.isSatisfiedBy("###"))
	}
}