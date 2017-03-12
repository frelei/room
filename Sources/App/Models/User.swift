import Foundation
import Vapor
import Fluent

final class User: Model {
    
    var id: Node?
    var name: String
    var email: String
    var password: String
    var exists: Bool = false

    
    init(name: String, email: String, password: String) {
        id = nil
        self.name = name
        self.email = email
        self.password = password
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
        email = try node.extract("email")
        password = try node.extract("password")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name,
            "email": email,
            "password": password
            ])
    }
    
}


extension User: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create("users") { user in
            user.id()
            user.string("name")
            user.string("email")
            user.string("password")
        }
    }
    static func revert(_ database: Database) throws {
        try database.delete("users")
    }
}
