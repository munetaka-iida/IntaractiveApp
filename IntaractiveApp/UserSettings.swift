//
//  UserSettings.swift
//  IntaractiveApp
//
//  Created by munetaka on 2017/01/23.
//  Copyright © 2017年 iida. All rights reserved.
//

import Foundation

enum UserSettings: String {
    
    // 会話のログ
    case textLog = "textLog"
    // 読み込まれたテキスト
    case stackText = "stackText"
    // ストーリーファイル名
    case lastTextName = "lastTextName"
    // ストーリーファイルの最後に読み込んだ行数
    case countColmun = "countColumn"
    
    func set(_ value: Any) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func get() -> Any {
        return UserDefaults.standard.object(forKey: self.rawValue)!
    }
    
    func getArray() -> Array<String>  {
        return UserDefaults.standard.object(forKey: self.rawValue) as! Array<String>
    }
    
}
