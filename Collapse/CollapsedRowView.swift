import SwiftUI
import SDWebImageSwiftUI

struct CollapsedRowView: View {
    
    @Binding var activeIndex: Int
    
    var user: UserElement
    var index: Int
    var isOpen: Bool {
        activeIndex == index
    }
    
    var width: CGFloat {
        isOpen ? 200 : 50
    }
    var height: CGFloat {
        200 * 1.5
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text(user.name)
                    .foregroundColor(Color.white)
                    .fixedSize()
                    .font(isOpen ? .system(.headline, design: .rounded) : .system(.headline, design: .rounded))
                    .padding(.top, isOpen ? 10 : 0)
                    .rotationEffect(Angle(degrees: isOpen ? 0 : 90))
                if isOpen {
                    WebImage(url: user.url, options: .progressiveLoad)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150, alignment: .center)
                        .cornerRadius(5)
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Job: \(user.job)")
                            .foregroundColor(Color.white)
                            .font(.system(.subheadline, design: .rounded))
                        Text("Skills: \(user.skills)")
                            .foregroundColor(Color.white)
                            .font(.system(.subheadline, design: .rounded))
                    }
                    .opacity(isOpen ? 1 : 0)
                }
            }
            .padding()
        }
        .frame(width: width, height: height, alignment: .center)
        .background(Color(hex: user.color))
        .cornerRadius(5)
        .onTapGesture {
            if self.isOpen {
                self.activeIndex = -1
            } else {
                self.activeIndex = self.index
            }
        }
    }
}

struct CollapsedRowView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsedRowView(
            activeIndex: .constant(-1),
            user: UserElement(
                id: "f638bd58-e4cb-4576-8a05-06703ab26715",
                avatar: "https://robohash.org/nequeenimcum.bmp?size=50x50&set=set1",
                name: "Star Wormald",
                skills: "Kurdish",
                job: "Paralegal",
                color: "#f42e54"
            ),
            index: 0
        )
    }
}
