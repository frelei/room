import Vapor
import Fluent
import Foundation

final class Room: Model {
    
    var id: Node?
    var name: String
    var number: Int
    var exists: Bool = false
    
    init(name: String, number: Int) {
        id = nil
        self.name = name
        self.number = number
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
        number = try node.extract("number")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name,
            "number": number
            ])
    }

}

extension Room: Preparation {
    
    static func prepare(_ database: Database) throws {
        try database.create("rooms") { room in
            room.id()
            room.string("name")
            room.integer("number")
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete("rooms")
    }
    
}
