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
        
        // シーンコントローラーのインスタンスを作成
        let scene = SceneController()
//        print(scene.loadFile("0"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
