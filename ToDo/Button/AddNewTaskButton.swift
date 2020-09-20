import SwiftUI

struct AddNewTaskButton: View {
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            VStack {
                Text("+")
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                    .frame(width: 70, height: 70)
                    .modifier(Background())
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .modifier(Shadow())
            }
            .frame(width: 70, height: 70)
            .background(Color(.clear))
            .padding(.all, 40)
        })
    }
}
