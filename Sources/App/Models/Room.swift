
import Vapor
import Foundation

final class Room {
    
    var name: String
    var number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
}
