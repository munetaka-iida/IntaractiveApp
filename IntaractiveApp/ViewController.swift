//
//  ViewController.swift
//  IntaractiveApp
//
//  Created by munetaka on 2017/01/23.
//  Copyright © 2017年 iida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        // isAutoPlayEnabledの存在で判断
        guard UserSettings.isAutoPlayEnabled.isSet() else {
            return
        }
        UserSettings.isAutoPlayEnabled.set(true)
        UserSettings.lastFile.set("0")
        UserSettings.countColmun.set(0)
        UserSettings.storyLog.set([])
        UserSettings.storyText.set(loadSceneFile("0"))
    }
    
    func DebugPrinter() {
        print(UserSettings.isAutoPlayEnabled.bool())
        print(UserSettings.lastFile.string())
        print(UserSettings.countColmun.integer())
        print(UserSettings.storyLog.array())
        print(UserSettings.storyText.array())
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
