//
//  TableViewController.swift
//  VideoPlayer
//
//  Created by Soemsak on 24/8/2561 BE.
//  Copyright © 2561 Trabal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class TableViewController: UITableViewController {

    var playerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 15
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Index path", indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell
        
        //For server url
        let url = URL(string: "https://video.fbkk11-1.fna.fbcdn.net/v/t42.9040-2/39748932_686161858415185_5774970123773280256_n.mp4?_nc_cat=0&efg=eyJ2ZW5jb2RlX3RhZyI6InN2ZV9zZCJ9&_nc_eui2=AeHJ_kdxS2F5P4mleYrysL6p_jkN1BJ6VzADs_5GPRZ_ZUrWjAwlQ0eTfB3UysUpUD-gR4lHqZ8oNTIKsP35wq2eLeOtQ0A42G-L3qDFJ_JdVA&oh=97df8208ee03a3eb87e4015c57c17eae&oe=5B8007D9")
        let playerItem = AVPlayerItem.init(url: url!)
        
        let player = AVPlayer(playerItem: playerItem)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
//        playerViewController.view.frame = CGRect(x: 0, y: 300, width: view.bounds.width, height: view.bounds.width)
//        playerViewController.showsPlaybackControls = true // 操作パネルを非表示にする場合はfalse
//        playerViewController.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue // 矩形にフィット
        
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(didPlayerItemReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        cell?.videoView.addSubview(playerViewController.view)
        playerViewController.view.frame = (cell?.videoView.bounds)!
        
        
    //        cell?.videoImageView.addSubview(playerViewController.view)
    //        playerViewController.view.frame = (cell?.videoImageView.bounds)!
        
        
//        player.pause()
                player.play()
        
        return cell!
    }
    
    deinit {
        print("Remove NotificationCenter Deinit")
        NotificationCenter.default.removeObserver(self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    @objc func didPlayerItemReachEnd(notification: NSNotification) {
        guard let player = playerViewController.player else {
            return
        }
        player.seek(to: kCMTimeZero)
        player.play()
    }

}
