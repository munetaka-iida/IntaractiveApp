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
    let Story = StoryController()
    
    @IBAction func tapDisplay(_ sender: Any) {
        Story.showMsg()
    }
    
    @IBAction func tapButton(_ sender: Any) {
        print("tap!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初回プレイ時のUserSettingsを初期化する
        setDefaultUserSettings()
        
//        DebugPrinter()
        // ストーリーコントローラーのインスタンスを作成
        Story.showMsg()
        
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
