//
//  isPlayingAVPlayer.swift
//  FFmpegExample
//
//  Created by Apple on 7/23/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import AVFoundation

extension AVPlayer {
    var isPlaying: Bool {
        return self.rate != 0 && self.error == nil
    }
}
