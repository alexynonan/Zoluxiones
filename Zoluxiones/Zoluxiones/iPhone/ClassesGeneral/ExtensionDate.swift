//
//  ExtensionString.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

extension Date {
    
    static func convertDateText(_ dateText: String, inDateWithFormat format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateText) ?? Date()
    }
    
    func convertDate(inDateWithFormat format: String, withLocale locale: Locale = Locale(identifier: Locale.current.identifier)) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
