import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CanvasView()
                .navigationTitle("Notely")
        }
    }
}

#Preview {
    ContentView()
}
