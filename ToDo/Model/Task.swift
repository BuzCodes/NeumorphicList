import CoreData
import Foundation

public class Task: NSManagedObject {
    @NSManaged public var date: Date?
    @NSManaged public var title: String?
    @NSManaged public var completed: NSNumber?
}
