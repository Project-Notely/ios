import Foundation

struct FileStorageHelper {
    static func saveSVG(_ svg: String, withFileName fileName: String) {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(fileName).svg") else { return }
        try? svg.write(to: url, atomically: true, encoding: .utf8)
    }
}
