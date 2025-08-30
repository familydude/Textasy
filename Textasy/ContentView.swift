import SwiftUI

struct ContentView: View {
    @State private var document = Document(title: "My Document", blocks: [
        Block(type: .heading, content: "What to focus on right now: a massive hit."),
        Block(type: .body, content: "Body text for whatever you\"d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story."),
        Block(type: .body, content: "Body text for whatever you\"d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story.")
    ])
    @State private var selectedBlock: Block? = nil

    var body: some View {
        NavigationView {
            SidebarView(document: $document, selectedBlock: $selectedBlock)
            EditorView(document: $document)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


