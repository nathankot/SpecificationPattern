import Foundation

public class RegularExpressionSpecification: CompositeSpecification {
	let regularExpression: NSRegularExpression
	
	public init(regularExpression: NSRegularExpression) {
		self.regularExpression = regularExpression
		super.init()
	}
	
	public convenience init(pattern: String) {
    let regularExpression = try? NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions(rawValue: 0))
		assert(regularExpression != nil, "the regular expression pattern must always compile")
		self.init(regularExpression: regularExpression!)
	}
	
	override public func isSatisfiedBy(candidate: Any?) -> Bool {
		if let s = candidate as? String {
			return regularExpression.numberOfMatchesInString(
        s,
        options: NSMatchingOptions(rawValue: 0),
        range: NSMakeRange(0, s.characters.count)) > 0
		}
		return false
	}
}
