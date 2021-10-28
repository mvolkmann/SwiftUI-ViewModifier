import SwiftUI

struct Collapsable: ViewModifier {
    private static let diameter = CGFloat(120)
    private static var radius: CGFloat { diameter / 2 }
    
    var color: Color
    
    @State var showContent = true
    
    var halfCircle: some View {
        Circle()
            .trim(from: 0, to: 0.5)
            .fill(.yellow)
            .frame(width: Collapsable.diameter, height: Collapsable.radius)
            .offset(x: 0, y: -16)
    }
    
private func toggle() {
    withAnimation {
        showContent.toggle()
        }
    }
    
    func body(content: Content) -> some View {
        VStack {
            if showContent {
                HStack {
                    Spacer()
                    content
                    Spacer()
                }.padding().border(color, width: 5)
            }
            HStack {
                Spacer()
                ZStack {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: Collapsable.radius / 3, height: Collapsable.radius / 4)
                        .onTapGesture { toggle() }
                        .rotationEffect(Angle.degrees(showContent ? 180 : 0))
                        .offset(x: 0, y: -2)
                        .background(halfCircle)
                }
                Spacer()
            }
        }
    }
}

extension View {
    func collapsable(color: Color = .black) -> some View {
        modifier(Collapsable(color: color))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
            Text("This is the second line.")
            //}.modifier(CollapsableModifier(color: .blue)) // long way
        }
        .collapsable(color: .green) // short way
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
