import Foundation

public class PredicateSpecification<T>: CompositeSpecification {
	let predicate: T -> Bool
	
	init(predicate: T -> Bool) {
		self.predicate = predicate
		super.init()
	}
	
	override public func isSatisfiedBy(candidate: Any?) -> Bool {
		if let obj = candidate as? T {
			return predicate(obj)
		}
		return false
	}
}
