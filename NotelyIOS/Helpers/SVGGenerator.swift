import Foundation

struct SVGGenerator {
    static func generateSVG(from strokes: [StrokeModel]) -> String {
        var svgString = "<svg xmlns='http://www.w3.org/2000/svg' version='1.1'>\n"
        for stroke in strokes {
            svgString += "<path d='M \(stroke.points.map { "\($0.x) \($0.y)" }.joined(separator: " L "))' "
            svgString += "fill='none' stroke='black' stroke-width='\(stroke.lineWidth)' />\n"
        }
        svgString += "</svg>"
        return svgString
    }
}
