//
//  MergeVideoAudioViewController.swift
//  FFmpegExample
//
//  Created by Apple on 7/17/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import AVKit

class MergeVideoAudioViewController: UIViewController {

    var url:URL?
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    
    @IBOutlet weak var mergeVideo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.player = AVPlayer(url: url!)
            self.avpController = AVPlayerViewController()
            self.avpController.player = self.player
            avpController.view.frame = mergeVideo.bounds
            self.addChild(avpController)
            self.mergeVideo.addSubview(avpController.view)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
