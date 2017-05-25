//
//  Extension.swift
//  IntaractiveApp
//
//  Created by m-iida on 2017/05/25.
//  Copyright © 2017年 iida. All rights reserved.
//

import Foundation

extension String {
    var lines: [String] {
        var lines = [String]()
        self.enumerateLines { (line, stop) -> () in
            if line.characters.count > 0 {
                lines.append(line)
            }
        }
        return lines
    }
}

extension String {
    func trim(_ string: String = " ") -> String {
        var set = Set<Character>()
        for c in string.characters {
            set.insert(Character(String(c)))
        }
        return trim(set)
    }
    func trim(_ characters: Set<Character>) -> String {
        if let index = self.characters.index(where: {!characters.contains($0)}) {
            return self[index..<self.endIndex]
        } else {
            return ""
        }
    }
}
