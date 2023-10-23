//
//  ExtString.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation

extension String {
    
    func trim(_ characterSet: CharacterSet) -> String {
            return self.trimmingCharacters(in: characterSet)
    }
}
