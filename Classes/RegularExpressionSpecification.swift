import Foundation

open class RegularExpressionSpecification: CompositeSpecification {
	let regularExpression: NSRegularExpression
	
	public init(regularExpression: NSRegularExpression) {
		self.regularExpression = regularExpression
		super.init()
	}
	
	public convenience init(pattern: String) {
    let regularExpression = try? NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
		assert(regularExpression != nil, "the regular expression pattern must always compile")
		self.init(regularExpression: regularExpression!)
	}
	
	override open func isSatisfiedBy(_ candidate: Any?) -> Bool {
		if let s = candidate as? String {
			return regularExpression.numberOfMatches(
        in: s,
        options: NSRegularExpression.MatchingOptions(rawValue: 0),
        range: NSMakeRange(0, s.count)) > 0
		}
		return false
	}
}
