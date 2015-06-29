import Foundation

public class RegularExpressionSpecification: CompositeSpecification {
	let regularExpression: NSRegularExpression
	
	public init(regularExpression: NSRegularExpression) {
		self.regularExpression = regularExpression
		super.init()
	}
	
	public convenience init(pattern: String) {
		var error: NSError?
		var regularExpression = NSRegularExpression(pattern: pattern, options: nil, error: &error)
		assert(error == nil, "the regular expression pattern must always compile")
		assert(regularExpression != nil, "the regular expression pattern must always compile")
		self.init(regularExpression: regularExpression!)
	}
	
	override public func isSatisfiedBy(candidate: Any?) -> Bool {
		if let s = candidate as? String {
			return regularExpression.numberOfMatchesInString(s, options: nil, range: NSMakeRange(0, count(s))) > 0
		}
		return false
	}
}
