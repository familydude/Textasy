import SwiftUI

struct CardView: View {
    @Binding var card: Card
    @State private var isHovered: Bool = false
    @State private var newTagName: String = ""
    @State private var offset: CGSize = .zero

    var onAddCard: (() -> Void)?
    var onDelete: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading) {
            TextEditor(text: $card.content)
                .font(.body)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .onHover {
                    isHovered = $0
                }
                .offset(x: offset.width, y: 0)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.offset = gesture.translation
                        }
                        .onEnded { gesture in
                            if gesture.translation.width < -100 {
                                onDelete?()
                            } else {
                                self.offset = .zero
                            }
                        }
                )
            
            HStack {
                ForEach(card.tags) {
                    tag in
                    TagView(tag: tag) {
                        removeTag(tag)
                    }
                }
                TextField("Add tag", text: $newTagName, onCommit: addTag)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
            }
            .padding(.horizontal)

            if isHovered {
                HStack {
                    Spacer()
                    Button(action: {
                        onAddCard?()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.accentColor)
                    }
                    Spacer()
                }
                .padding(.top, 5)
            }
        }
    }

    private func addTag() {
        if !newTagName.isEmpty && !card.tags.contains(where: { $0.name == newTagName }) {
            card.tags.append(Tag(name: newTagName))
            newTagName = ""
        }
    }

    private func removeTag(_ tag: Tag) {
        card.tags.removeAll(where: { $0.id == tag.id })
    }
}

struct CardView_Previews: PreviewProvider {
    @State static var sampleCard = Card(content: "Body text for whatever you\"d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story.", tags: [Tag(name: "Important"), Tag(name: "Draft")])

    static var previews: some View {
        CardView(card: $sampleCard)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


