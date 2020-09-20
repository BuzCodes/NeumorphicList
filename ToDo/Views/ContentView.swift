import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Task.getAllTask()) var tasks: FetchedResults<Task>
    @State private var newTaskTitle: String = ""
    @State private var showModelView: Bool = false
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)).withAlphaComponent(0.9)
        UITableViewCell.appearance().backgroundColor = UIColor(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)).withAlphaComponent(0.3)
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottomTrailing) {
                TaskList(tasks: tasks, shouldShowModelView: $showModelView, onTapGesture: { task in
                    task.toggleCompleted()
                    self.save()
                }, onDelete: { task in
                    self.deleteTask(task: task)
                })
                
                if showModelView {
                    ModalView(newTaskTitle: $newTaskTitle) {
                        self.addNewTask()
                        self.showModelView.toggle()
                    }
                    
                } else {
                    AddNewTaskButton {
                        self.showModelView.toggle()
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

//MARK:- CRUD Operations
extension ContentView {
    
    private func addNewTask() {
        let newTask = Task(context: self.managedObjectContext)
        newTask.title = self.newTaskTitle
        newTask.date = Date()
        newTask.completed = false
        
        newTaskTitle = ""
        save()
    }
    
    private func deleteTask(task: Task) {
        managedObjectContext.delete(task)
        save()
    }
    
    private func save() {
        do {
            try self.managedObjectContext.save()
        } catch {
            print("Error: ", error)
        }
    }
}
