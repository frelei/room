//
//  DateExtension.swift
//  Room
//
//  Created by Rodrigo Leite on 11/03/17.
//
//

import Foundation


extension String {

    func toDate(byFormatter: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = byFormatter
        return dateFormatter.date(from: self)
    }
    
}

extension Date {
    
    func toFormat(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
