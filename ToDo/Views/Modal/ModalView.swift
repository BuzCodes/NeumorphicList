import SwiftUI

struct ModalView: View {
    @ObservedObject private var keyboardHandler = KeyboardHandler()
    @Binding var newTaskTitle: String
    
    let buttonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add new Task")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
            
            HStack {
                TextField("Ex.: Meeting with Alex", text: self.$newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                
                Button(action: buttonAction) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                        .imageScale(.large)
                }.disabled(self.newTaskTitle.isEmpty)
            }
            .padding()
            
            Spacer()
        }
        .background(ModalBackgroundView())
        .frame(maxHeight: 140 + keyboardHandler.keyboardHeight)
    }
}

