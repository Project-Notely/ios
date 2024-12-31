import SwiftUI

struct ToolbarView: View {
    @Binding var strokes: [StrokeModel]

    var body: some View {
        HStack {
            Button(action: clearCanvas) {
                Image(systemName: "trash")
                    .padding()
            }
        }
    }

    private func clearCanvas() {
        strokes.removeAll()
    }
}
