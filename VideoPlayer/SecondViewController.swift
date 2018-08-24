//
//  SecondViewController.swift
//  VideoPlayer
//
//  Created by Ary on 2015/05/08.
//  Copyright (c) 2015年 Trabal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class SecondViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For local url
        let moviePath = Bundle.main.path(forResource: "hogevideo", ofType: "mov")!
        let url = URL(fileURLWithPath: moviePath)
        
        //For server url
        //let url = URL(string: "")
        
        let playerItem = AVPlayerItem.init(url: url)
        
        player = AVPlayer(playerItem: playerItem)
        
        player?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
