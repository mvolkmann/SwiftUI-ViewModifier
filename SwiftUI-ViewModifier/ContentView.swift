import SwiftUI

struct ContentView: View {
    private static let bgColor = Color(hue: 0.5, saturation: 0.3, brightness: 1)
    
    var body: some View {
        VStack {
            Text("Before")
            
            VStack {
                Text("Hello, world!")
                Text("This is the second line.")
            }
            .padding()
            
            // This is the long way to apply a view modifier
            // that doesn't use a View extension.
            //.modifier(Collapsable(bgColor: ContentView.bgColor))
            
            // This is the short way to apply a view modifier
            // using a View extension.
            .collapsable(bgColor: ContentView.bgColor)
            
            Text("After")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
