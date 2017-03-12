//
//  HTTPExtension.swift
//  Room
//
//  Created by Rodrigo Leite on 12/03/17.
//
//

import Foundation
import Vapor
import Fluent
import HTTP

extension Request {
    
    func post<T: Model>() throws -> T {
        guard let json = json else { throw Abort.badRequest }
        return try T(node: json)
    }
    
}
