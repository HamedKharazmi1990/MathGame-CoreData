//
//  NumericExtention.swift
//  Math Game
//
//  Created by Hamed Kharazmi on 24.01.26.
//

import Foundation

let ordinalFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .ordinal
    return numberFormatter
}()

extension Numeric {
    var ordinal: String {
        return ordinalFormatter
            .string(for: self) ?? String(describing: self)
    }
}
