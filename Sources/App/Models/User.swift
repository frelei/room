import Foundation
import Vapor
import Fluent

final class User: Model {
    
    var id: Node?
    var name: String
    var email: String
    
    init(name: String, email: String) {
        id = nil
        self.name = name
        self.email = email
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
        email = try node.extract("email")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name,
            "email": email
            ])
    }
    
}


extension User: Preparation {
    static func prepare(_ database: Database) throws {}
    static func revert(_ database: Database) throws {}
}
