import CoreData
import Foundation

extension Task: Identifiable {}

extension Task {
    static func getAllTask() -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
    
    func toggleCompleted() {
        completed = completed == true ? false : true
    }
    
    var dateFormatted: String {
        guard let date = date else { return "N/A" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = date.isToday ? "MMM d, h:mm a" : "MMM d, yyyy"
        
        return dateFormatter.string(from: date)
    }
}
