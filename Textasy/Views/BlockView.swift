import SwiftUI

struct BlockView: View {
    @Binding var block: Block
    var onAddCard: (() -> Void)?
    var onDelete: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading) {
            if block.type == .heading {
                TextEditor(text: $block.content)
                    .font(.largeTitle)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.clear)
                    .cornerRadius(8)
            } else {
                CardView(card: .constant(Card(content: block.content)), onAddCard: onAddCard, onDelete: onDelete)
            }
        }
    }
}

struct BlockView_Previews: PreviewProvider {
    @State static var sampleBlock = Block(type: .heading, content: "What to focus on right now: a massive hit.")
    @State static var sampleBodyBlock = Block(type: .body, content: "Body text for whatever you\"d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story.")

    static var previews: some View {
        BlockView(block: $sampleBlock)
            .previewLayout(.sizeThatFits)
            .padding()

        BlockView(block: $sampleBodyBlock)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


