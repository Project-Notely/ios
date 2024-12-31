import SwiftUI
import UIKit

struct DrawingView: UIViewRepresentable {
    @Binding var strokes: [StrokeModel]
    
    func makeUIView(context: Context) -> CanvasUIView {
        let view = CanvasUIView()
        view.onStrokeCaptured = { stroke in
            strokes.append(stroke)
        }
        return view
    }
    
    func updateUIView(_ uiView: CanvasUIView, context: Context) {}
}

class CanvasUIView: UIView {
    private var currentStroke: [CGPoint] = []
    var onStrokeCaptured: ((StrokeModel) -> Void)?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        currentStroke = [touch.location(in: self)]
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !currentStroke.isEmpty else { return }
        let stroke = StrokeModel(points: currentStroke, color: .black, lineWidth: 2.0)
        currentStroke = []
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        let path = UIBezierPath()
        for (i, point) in currentStroke.enumerated() {
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.lineWidth = 2
        path.stroke()
    }
}
