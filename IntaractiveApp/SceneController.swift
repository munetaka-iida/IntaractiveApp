//
//  SceneController.swift
//  IntaractiveApp
//
//  Created by munetaka on 2017/01/23.
//  Copyright © 2017年 iida. All rights reserved.
//

import UIKit

class SceneController: UIViewController {

    
    func loadFile(_ name: String) -> Array<String> {
        let path = Bundle.main.path(forResource: name, ofType: "txt")!
        if let data = NSData(contentsOfFile: path) {
            let textData = String(NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)!)
            return textData.lines
        }
        return []
    }
    
}

