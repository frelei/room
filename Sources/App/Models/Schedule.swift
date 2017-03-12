import Foundation
import Vapor
import Fluent

final class Schedule: Model {
    
    var id: Node?
    var date: String
    var userId: Node
    var roomId: Node
    var exists: Bool = false
    
    init(date: String, userId:Node, roomId:Node) {
        id = nil
        self.date = date
        self.userId = userId
        self.roomId = roomId
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        date = try node.extract("date")
        userId = try node.extract("user_id")
        roomId = try node.extract("room_id")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "date": date,
            "user_id": userId,
            "room_id": roomId
            ])
    }
    
}

extension Schedule: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create("schedules") { schedule in
            schedule.id()
            schedule.string("date")
            schedule.parent(User.self, optional: false)
            schedule.parent(Room.self, optional: false)
        }
    }
    static func revert(_ database: Database) throws {
        try database.delete("schedules")
    }
}
