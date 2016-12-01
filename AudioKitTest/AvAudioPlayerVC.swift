//
//  AvAudioPlayerVC.swift
//  AudioKitTest
//
//  Created by Michiel Koorn on 01/12/2016.
//  Copyright © 2016 appcentric. All rights reserved.
//

import UIKit
import AVFoundation

class AvAudioPlayerVC: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func playButtonPressed(_ sender: UIButton) {
        
        if sender.titleLabel!.text == "Play" {
            self.loadSong()
            sender.setTitle("Stop", for: UIControlState())
            self.player?.prepareToPlay()
            self.player?.play()
            
        } else {
            sender.setTitle("Play", for: UIControlState())
            self.player?.stop()
        }
    }
    
    func loadSong() {
        
        if let audioFileUrl = Bundle.main.url(forResource: songName, withExtension: "mp3") {
        
            do {
                self.player = try AVAudioPlayer(contentsOf: audioFileUrl)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
