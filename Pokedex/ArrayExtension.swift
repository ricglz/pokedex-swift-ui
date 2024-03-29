//
//  ArrayExtension.swift
//  Pokedex
//
//  Created by Ricardo J. González on 31/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size:Int) -> [[Element]] {

        var chunkedArray = [[Element]]()

        for index in 0...self.count {
            if index % size == 0 && index != 0 {
                chunkedArray.append(Array(self[(index - size)..<index]))
            } else if(index == self.count) {
                chunkedArray.append(Array(self[index - 1..<index]))
            }
        }

        return chunkedArray
    }

    func isNotEmpty() -> Bool {
        !self.isEmpty
    }
}
