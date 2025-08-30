import Foundation

enum BlockType: Identifiable, CaseIterable {
    case heading
    case body

    var id: Self { self }
}

struct Block: Identifiable {
    let id = UUID()
    var type: BlockType
    var content: String
    var tags: [Tag] = []
}

struct Card: Identifiable {
    let id = UUID()
    var content: String
    var tags: [Tag] = []
}

struct Tag: Identifiable, Hashable {
    let id = UUID()
    var name: String
}

struct Document: Identifiable {
    let id = UUID()
    var title: String
    var blocks: [Block]
}


