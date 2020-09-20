import SwiftUI

struct TaskList: View {
    var tasks: FetchedResults<Task>

    @Binding var shouldShowModelView: Bool

    let onTapGesture: (Task) -> Void
    let onDelete: (Task) -> Void

    var body: some View {
        List {
            ForEach(tasks) { task in
                TaskCell(task: task)
                    .onTapGesture(perform: {
                        self.onTapGesture(task)
                    })
            }
            .onDelete(perform: { indexSet in
                self.onDelete(self.tasks[indexSet.first!])
            })
        }
        .animation(.easeOut)
        .navigationBarItems(trailing: EditButton().foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))))
        .navigationBarTitle(Text("Tasks"))
    }
}
