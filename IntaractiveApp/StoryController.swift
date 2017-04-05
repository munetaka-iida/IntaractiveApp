//
//  SceneController.swift
//  IntaractiveApp
//
//  Created by munetaka on 2017/01/23.
//  Copyright © 2017年 iida. All rights reserved.
//

import UIKit

class StoryController: UIViewController {
    
    // 自動的に一行ずつ読み進める
    func autoPlay() {
        guard UserSettings.isAutoPlayEnabled.bool() else {
            return
        }
        
        // テキストファイルの１行目を取得する
        let line = getLine().components(separatedBy: "|")
        print(line)
        
        
        // -- コマンド --
        
        if line.count > 1 {
            let cmd = line[0].components(separatedBy: " ")
            print("cmd:", cmd[0])
            
            switch cmd[0] {
            case "on":
                print("on")
            case "off":
                print("off")
            case "next":
                print("next")
            case "wait":
                print("wait")
            case "button":
                print("button")
            default:
                print("default")
            }
            
            print(line[1].trim())
            
        
        } else {
            // 普通のテキストを表示する
        }

        
    }

    func setupTweet(_ text: String) {
        
        // 対象の文字列
        let targetString = text
        
        // 正規表現パターン
        let matchPattern = ""

        print("test")
        // マッチした文字列をすべて表示
        let matches = getMatchStrings(targetString: targetString, pattern: matchPattern)
        for str in matches {
            print(str)
        }

    }
    
    // UserSettings.storyText から１行目のテキストを取得する
    func getLine() -> String {
        if let line = UserSettings.storyText.array().first {
            // 取得した１行目を削除して保存する
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
                
                // rangeAtIndexに0を渡すとマッチ全体が、1以降を渡すと括弧でグループにした部分マッチが返される
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

