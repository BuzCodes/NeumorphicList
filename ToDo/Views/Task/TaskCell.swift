import SwiftUI

struct TaskCell: View {
    @ObservedObject var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.completed == true ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                .padding(16)
            
            VStack(alignment: .leading) {
                Text(task.title ?? "")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(5)
                Text(task.dateFormatted)
                    .font(.caption)
                    .padding(5)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .modifier(Background())
        .cornerRadius(16)
    }
}
