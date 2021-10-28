import SwiftUI

struct Collapsable: ViewModifier {
    private static let diameter = CGFloat(120)
    private static var radius: CGFloat { diameter / 2 }
    
    var bgColor: Color = .gray
    var duration: Double = 0.5
    
    @State var showContent = true
    
    var halfCircle: some View {
        Circle()
            .trim(from: 0, to: 0.5)
            .fill(bgColor)
            .frame(width: Collapsable.diameter, height: Collapsable.radius)
            .offset(x: 0, y: -16)
    }
    
    private func toggle() {
        withAnimation(.easeInOut(duration: duration)) {
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
                }
                .background(bgColor)
                
                //TODO: Can you scale the height of the HStack
                //TOOO: instead of using the default fade transition?
                //.transition(.scale)
                //.scaleEffect(showContent ? 1 : 0)
                //.animation(.easeInOut(duration: 1))
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
    func collapsable(bgColor: Color = .black, duration: Double = 0.5) -> some View {
        modifier(Collapsable(bgColor: bgColor, duration: duration))
    }
}
