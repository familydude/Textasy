import SwiftUI

struct EditorView: View {
    @Binding var document: Document

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(document.blocks.indices, id: \.self) {
                    index in
                    BlockView(block: $document.blocks[index], onAddCard: {
                        addCard(at: index)
                    }, onDelete: {
                        deleteBlock(at: index)
                    })
                }
            }
            .padding()
        }
    }

    private func addCard(at index: Int) {
        let newCard = Block(type: .body, content: "New card content.")
        document.blocks.insert(newCard, at: index + 1)
    }

    private func deleteBlock(at index: Int) {
        document.blocks.remove(at: index)
    }
}

struct EditorView_Previews: PreviewProvider {
    @State static var sampleDocument = Document(title: "Sample Document", blocks: [
        Block(type: .heading, content: "What to focus on right now: a massive hit."),
        Block(type: .body, content: "Body text for whatever you\"d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story."),
        Block(type: .body, content: "Body text for whatever you\"d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story.")
    ])

    static var previews: some View {
        EditorView(document: $sampleDocument)
    }
}


