import SwiftUI

struct CanvasView: View {
    @State private var strokes: [StrokeModel] = []
    
    var body: some View {
        VStack {
            DrawingView(strokes: $strokes)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            
            ToolbarView(strokes: $strokes)
        }
    }
}
