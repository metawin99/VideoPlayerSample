//
//  ThirdViewController.swift
//  VideoPlayer
//
//  Created by Ary on 2015/05/08.
//  Copyright (c) 2015年 Trabal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ThirdViewController: UIViewController {

    var playerViewController: AVPlayerViewController!
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For local url
        let bundle = Bundle.main
        let path = bundle.path(forResource: "hogevideo", ofType: "mov")
        let url = URL(fileURLWithPath: path!)
        
        //For server url
        //let url = URL(string: "")
        let playerItem = AVPlayerItem.init(url: url)
        
        let player = AVPlayer(playerItem: playerItem)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        playerViewController.view.frame = CGRect(x: 0, y: 300, width: view.bounds.width, height: view.bounds.width)
        playerViewController.showsPlaybackControls = true // 操作パネルを非表示にする場合はfalse
        playerViewController.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue // 矩形にフィット
        
        NotificationCenter.default.addObserver(self, selector: #selector(didPlayerItemReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        videoView.addSubview(playerViewController.view)
        playerViewController.view.frame = videoView.bounds
        
        player.play()
        
    }
    
    @objc func didPlayerItemReachEnd(notification: NSNotification) {
        guard let player = playerViewController.player else {
            return
        }
        player.seek(to: kCMTimeZero)
        player.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

