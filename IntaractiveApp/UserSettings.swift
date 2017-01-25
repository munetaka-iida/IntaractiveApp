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
    case isAutoPlayEnabled = "isAutoPlayEnabled"
    
    // 会話のログ
    case storyLog = "storyLog"
    
    // 読み込まれたテキスト
    case storyText = "storyText"
    
    // ストーリーファイル名
    case lastFile = "lastFile"

    // ストーリーファイルの最後に読み込んだ行数
    case countColmun = "countColumn"
    
    // String
    func set(_ value: String) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func string() -> String {
        return UserDefaults.standard.string(forKey: self.rawValue)!
    }

    // Integer
    func set(_ value: Int) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func integer() -> Int {
        return UserDefaults.standard.integer(forKey: self.rawValue)
    }
    
    // Float
    func set(_ value: Float) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func float() -> Float {
        return UserDefaults.standard.float(forKey: self.rawValue)
    }
    
    // Double
    func set(_ value: Double) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func double() -> Double {
        return UserDefaults.standard.double(forKey: self.rawValue)
    }
    
    // Bool
    func set(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func bool() -> Bool {
        return UserDefaults.standard.bool(forKey: self.rawValue)
    }
    
    // Array
    func set(_ value: Array<String>) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func array() -> Array<String>  {
        return UserDefaults.standard.object(forKey: self.rawValue) as! Array<String>
    }
    
    // Any
    func set(_ value: Any) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func object() -> Any? {
        return UserDefaults.standard.object(forKey: self.rawValue)
    }
    
    // 設定されているか
    func isSet() -> Bool {
        if (UserDefaults.standard.object(forKey: self.rawValue) != nil) {
            return true
        } else {
            return false
        }
    }
    
}
