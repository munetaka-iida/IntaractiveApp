//
//  SceneController.swift
//  IntaractiveApp
//
//  Created by munetaka on 2017/01/23.
//  Copyright © 2017年 iida. All rights reserved.
//

import UIKit

class SceneController: UIViewController {
    
    // 自動的に一行ずつ読み進める
    func autoRead() {
    
    }
    
    // シナリオを保存
    func saveSceneText() {
    
    }
    
    // ログを保存
    func saveSceneLog() {
    
    }

    // シナリオを読込
    func loadSceneFile(_ name: String) -> Array<String> {
        let path = Bundle.main.path(forResource: name, ofType: "txt")!
        if let data = NSData(contentsOfFile: path) {
            let textData = String(NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)!)
            return textData.lines
        }
        return []
    }
    
}

