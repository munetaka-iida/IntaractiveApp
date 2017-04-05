//
//  ViewController.swift
//  IntaractiveApp
//
//  Created by munetaka on 2017/01/23.
//  Copyright © 2017年 iida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let debugMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初回プレイ時のUserSettingsを初期化する
        setDefaultUserSettings()
        
        DebugPrinter()
        // ストーリーコントローラーのインスタンスを作成
        let story = StoryController()
        story.autoPlay()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setDefaultUserSettings() {
        // 初期化を判断する
//        guard UserSettings.isAutoPlayEnabled.isSet() else {
//            return
//        }
        UserSettings.isAutoPlayEnabled.set(true)
        UserSettings.lastFile.set("0")
        UserSettings.countColmun.set(0)
        UserSettings.storyLog.set([])
        UserSettings.storyText.set(loadSceneFile("0"))
    }
    
    func DebugPrinter() {
        print("Debug Printer ----------------")
        print("isAutoEnabled:", UserSettings.isAutoPlayEnabled.bool())
        print("Last File    :", UserSettings.lastFile.string())
        print("Count Colmun :", UserSettings.countColmun.integer())
        print("Story Log    :", UserSettings.storyLog.array())
        print("Story Array  :", UserSettings.storyText.array())
    }
    
}

func loadSceneFile(_ name: String) -> Array<String> {
    let path = Bundle.main.path(forResource: name, ofType: "txt")!
    if let data = NSData(contentsOfFile: path) {
        let textData = String(NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)!)
        return textData.lines
    }
    return []
}

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
