//
//  AppMusicViewController.swift
//  FFmpegExample
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import AVFoundation

struct Song {
    let name:String
    let albumName:String
    let trackName:String
    let image:String
    let artist:String
}

class AppMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var songs = [Song]()
    var audioPlayer: AVAudioPlayer?
    var sound:URL?
    var position = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSong()
        createAudioSession()
        table.delegate = self
        table.dataSource = self
    }
    
    func createAudioSession(){
        do {
            /// this codes for making this app ready to takeover the device nlPlayer
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback,mode:.moviePlayback ,options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
             //print("error: \(error.localizedDescription)")
         }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        //configure
        if indexPath.row == position {
            cell.textLabel?.textColor = UIColor.red
        } else{
            cell.textLabel?.textColor = UIColor.black
        }
        cell.textLabel?.text = song.trackName
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.image)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //present player
        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.red
        position = indexPath.row
        //songs
        playBackgroundMusic(songName: songs[indexPath.row].trackName)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.black
    }
    
    func playBackgroundMusic(songName:String) {
        let aSound = getFileURL(song: songName)
        sound = aSound
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
    
    func getFileURL(song:String) -> URL  {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: song, ofType: "mp3")!)
        return aSound as URL
    }
    
    @IBAction func GetMusic(_ sender: Any) {
        if position != -1 {
            let mainVC = self.navigationController?.viewControllers[0] as! ViewController
            mainVC.audioURL = sound
            mainVC.arrURL.append(sound!)
            mainVC.songDetail.append(songs[position])
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func configureSong(){
        songs.append(Song(name: "BanhTroiNuoc", albumName: "Music", trackName: "BanhTroiNuoc", image: "SongList", artist: "HoangThuyLinh"))
        songs.append(Song(name: "BuaYeu", albumName: "Music", trackName: "BuaYeu", image: "SongList", artist: "BichPhuong"))
        songs.append(Song(name: "MotCuLua", albumName: "Music", trackName: "MotCuLua", image: "SongList", artist: "BichPhuong"))
        songs.append(Song(name: "Roi", albumName: "Music", trackName: "RoiRemix", image: "SongList", artist: "HoangThuyLinh"))
        songs.append(Song(name: "BanhTroiNuoc", albumName: "Music", trackName: "BanhTroiNuoc", image: "SongList", artist: "HoangThuyLinh"))
        songs.append(Song(name: "BuaYeu", albumName: "Music", trackName: "BuaYeu", image: "SongList", artist: "BichPhuong"))
        songs.append(Song(name: "MotCuLua", albumName: "Music", trackName: "MotCuLua", image: "SongList", artist: "BichPhuong"))
        songs.append(Song(name: "Roi", albumName: "Music", trackName: "RoiRemix", image: "SongList", artist: "HoangThuyLinh"))
        songs.append(Song(name: "BanhTroiNuoc", albumName: "Music", trackName: "BanhTroiNuoc", image: "SongList", artist: "HoangThuyLinh"))
        songs.append(Song(name: "BuaYeu", albumName: "Music", trackName: "BuaYeu", image: "SongList", artist: "BichPhuong"))
        songs.append(Song(name: "MotCuLua", albumName: "Music", trackName: "MotCuLua", image: "SongList", artist: "BichPhuong"))
        songs.append(Song(name: "Roi", albumName: "Music", trackName: "RoiRemix", image: "SongList", artist: "HoangThuyLinh"))
        songs.append(Song(name: "BanhTroiNuoc", albumName: "Music", trackName: "BanhTroiNuoc", image: "SongList", artist: "HoangThuyLinh"))
        songs.append(Song(name: "BuaYeu", albumName: "Music", trackName: "BuaYeu", image: "SongList", artist: "BichPhuong"))
        songs.append(Song(name: "MotCuLua", albumName: "Music", trackName: "MotCuLua", image: "SongList", artist: "BichPhuong"))
        songs.append(Song(name: "Roi", albumName: "Music", trackName: "RoiRemix", image: "SongList", artist: "HoangThuyLinh"))
    }
}
