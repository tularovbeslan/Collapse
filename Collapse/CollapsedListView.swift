import SwiftUI

struct CollapsedListView: View {
    @ObservedObject var store: UserStore
    @State private var activeIndex: Int = -1
    
    var body: some View {
        VStack {
            HStack {
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack(spacing: 2) {
                        ForEach(store.users.indices, id:  \.self) { index in
                            CollapsedRowView(
                                activeIndex: self.$activeIndex,
                                user: self.store.users[index],
                                index: index
                            )
                        }
                    }
                }
                .animation(.spring(response: 0.2, dampingFraction: 0.8, blendDuration: 0))
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsedListView(store: UserStore())
    }
}
