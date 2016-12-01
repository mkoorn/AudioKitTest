//
//  ViewController.swift
//  AudioKitTest
//
//  Created by Michiel Koorn on 28/11/2016.
//  Copyright © 2016 appcentric. All rights reserved.
//

import UIKit
import AudioKit

class AudioKitVC: UIViewController {

    var player:AKAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AudioKit.stop()
    }

    @IBAction func loadAndPLaypressed(_ sender: UIButton) {
        
        if sender.titleLabel!.text == "Play" {
            self.loadSong()
            sender.setTitle("Stop", for: UIControlState())
            self.player?.play()
            
        } else {
            sender.setTitle("Play", for: UIControlState())
            self.player?.stop()
        }
    }
    
    func loadSong() {
        
        if self.player == nil {
        
            if let audioFileUrl = Bundle.main.url(forResource: songName, withExtension: "mp3") {
                
                do {
                    
                    let audioFile = try AKAudioFile(forReading: audioFileUrl)
                    self.player = try AKAudioPlayer(file: audioFile) {
                        print("completion callback has been triggered !")
                    }
                    
                    AudioKit.output = player
                    AudioKit.start()
                    
                } catch {
                    NSLog("\(error)")
                }
            }
        }
    }
}

