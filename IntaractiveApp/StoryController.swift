//
//  SceneController.swift
//  IntaractiveApp
//
//  Created by munetaka on 2017/01/23.
//  Copyright © 2017年 iida. All rights reserved.
//

import UIKit

class StoryController: UIViewController {
    
    func showMsg() {
        
        let line = getLine().trim().components(separatedBy: "|")

        // コマンド
        if line.count > 1 {
            
            let cmd = line[0].trim().components(separatedBy: " ")
            
            switch cmd[0] {
            case "on":
                let flags = cmd[1].components(separatedBy: ",")
                for flag in flags {
                    UserDefaults.standard.set(true, forKey: flag.trim())
                    UserDefaults.standard.synchronize()
                }
                if 1 < line[1].trim().characters.count {
                    print(line[1].trim())
                } else {
                    showMsg()
                }
            case "off":
                let flags = cmd[1].components(separatedBy: ",")
                for flag in flags {
                    UserDefaults.standard.set(false, forKey: flag.trim())
                    UserDefaults.standard.synchronize()
                }
                if 1 < line[1].trim().characters.count {
                    print(line[1].trim())
                } else {
                    showMsg()
                }
            case "next":
                UserSettings.storyText.set(loadSceneFile(cmd[1]))
                if 1 < line[1].trim().characters.count {
                    print(line[1].trim())
                } else {
                    showMsg()
                }
            case "show":
                var canShowMsg = true
                let flags = cmd[1].components(separatedBy: ",")
                for flag in flags {
                    if UserDefaults.standard.bool(forKey: flag.trim()) == false {
                        canShowMsg = false
                        break
                    }
                }
                if canShowMsg {
                    print(line[1].trim())
                } else {
                    showMsg()
                }
            case "button":
                print("button")
            default:
                print("default")
            }
            
            
        } else {
            print(line[0].trim())
        }
    }

//    func setupMsg(_ text: String) {
//        
//        let targetString = text
//        let matchPattern = ""
//        print("test")
//        // マッチした文字列をすべて表示
//        let matches = getMatchStrings(targetString: targetString, pattern: matchPattern)
//        for str in matches {
//            print(str)
//        }
//
//    }
    
    // ストーリーテキストから１行取得する
    func getLine() -> String {
        if let line = UserSettings.storyText.array().first {
            // ストーリーテキストの取得した１行目を削除して、更新する
            var _storyText = UserSettings.storyText.array()
            _storyText.removeFirst()
            UserSettings.storyText.set(_storyText)
            return line
        }
        return ""
    }
    
    // 正規表現にマッチした文字列を格納した配列を返す
    func getMatchStrings(targetString: String, pattern: String) -> [String] {
        var matchStrings:[String] = []
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let targetStringRange = NSRange(location: 0, length: (targetString as NSString).length)
            let matches = regex.matches(in: targetString, options: [], range: targetStringRange)
            for match in matches {
                // rangeAtIndexに0を渡すとマッチ全体が、
                // 1以降を渡すと括弧でグループにした部分マッチが返される
                let range = match.rangeAt(0)
                let result = (targetString as NSString).substring(with: range)
                matchStrings.append(result)
            }
            return matchStrings
        } catch {
            print("error: getMatchStrings")
        }
        return []
    }
}

