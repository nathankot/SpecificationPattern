import Foundation

open class PredicateSpecification<T>: CompositeSpecification {
	let predicate: (T) -> Bool
	
	init(predicate: @escaping (T) -> Bool) {
		self.predicate = predicate
		super.init()
	}
	
	override open func isSatisfiedBy(_ candidate: Any?) -> Bool {
		if let obj = candidate as? T {
			return predicate(obj)
		}
		return false
	}
}
