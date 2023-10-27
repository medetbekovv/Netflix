//
//  Extensions.swift
//  Netflix
//
//  Created by Sultan on 27/10/23.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
