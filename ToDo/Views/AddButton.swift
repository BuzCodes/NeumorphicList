import SwiftUI

struct AddNewTaskButton: View {
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            Text("+")
            .padding(.all, 50)
            .background(Circle()
                        .fill(Color.black)
                        .scaledToFill()
                        .frame(width: 50, height: 50))
        })
        
    }
}
