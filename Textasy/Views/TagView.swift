import SwiftUI

struct TagView: View {
    var tag: Tag
    var onRemove: (() -> Void)?

    var body: some View {
        HStack {
            Text(tag.name)
                .font(.caption)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            
            if let onRemove = onRemove {
                Button(action: onRemove) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: Tag(name: "Important"))
            .previewLayout(.sizeThatFits)
            .padding()
        
        TagView(tag: Tag(name: "Urgent")) {
            print("Remove tag")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}


