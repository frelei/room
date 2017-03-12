import Foundation
import Vapor
import Fluent

final class Schedule: Model {
    
    var id: Node?
    var date: String
    var user: Node
    var room: Node
    
    init(date: String, user:Node, room:Node) {
        id = nil
        self.date = date
        self.user = user
        self.room = room
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        date = try node.extract("date")
        user = try node.extract("user")
        room = try node.extract("room")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "date": date,
            "user": user,
            "room": room
            ])
    }
    
}

extension Schedule: Preparation {
    static func prepare(_ database: Database) throws {}
    static func revert(_ database: Database) throws {}
}
