import SwiftUI

struct ModalBackgroundView: View {
    var body: some View {
        Group {
            Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                .cornerRadius(16)
        }
        .modifier(Shadow())
    }
}
