import SwiftUI

struct SidebarView: View {
    @Binding var document: Document
    @Binding var selectedBlock: Block?

    var body: some View {
        List {
            Text("Heading")
                .font(.headline)
                .foregroundColor(.gray)
            ForEach(document.blocks.filter { $0.type == .heading }) {
                block in
                Text(block.content)
                    .font(.subheadline)
                    .onTapGesture {
                        selectedBlock = block
                    }
            }
            Divider()
            Text("Menu Label")
                .font(.subheadline)
            // Placeholder for other menu items
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 150, idealWidth: 200, maxWidth: 250)
    }
}

struct SidebarView_Previews: PreviewProvider {
    @State static var sampleDocument = Document(title: "Sample Document", blocks: [
        Block(type: .heading, content: "What to focus on right now: a massive hit."),
        Block(type: .body, content: "Body text for whatever you\"d like to say."),
        Block(type: .heading, content: "Another Heading"),
        Block(type: .body, content: "More body text.")
    ])
    @State static var selectedBlock: Block? = nil

    static var previews: some View {
        SidebarView(document: $sampleDocument, selectedBlock: $selectedBlock)
    }
}


