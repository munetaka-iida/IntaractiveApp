// UserSettingsにデータを格納する

import Foundation

enum UserSettings: String {

    case isAutoPlayEnabled = "isAutoPlayEnabled"
    
    case storyLog    = "storyLog"
    case storyText   = "storyText"
    case lastFile    = "lastFile"
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
    
    // Keyが設定されていればTrueを返す
    func isSet() -> Bool {
        if (UserDefaults.standard.object(forKey: self.rawValue) != nil) {
            return true
        } else {
            return false
        }
    }
    
}
