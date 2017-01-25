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
        // １行取得する
        // １行を解析して処理する
        var test = getTweet().components(separatedBy: "|")
        print(test)
        
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
    
    func getTweet() -> String {
        if let tweet = UserSettings.storyText.array().first {
            // １行削除
            var _storyText = UserSettings.storyText.array()
            _storyText.removeFirst()
            // 保存
            UserSettings.storyText.set(_storyText)
            return tweet
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

