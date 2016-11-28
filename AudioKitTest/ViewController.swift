//
//  ViewController.swift
//  AudioKitTest
//
//  Created by Michiel Koorn on 28/11/2016.
//  Copyright © 2016 appcentric. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loadAndPLaypressed(_ sender: Any) {
        
        if let audioFileUrl = Bundle.main.url(forResource: "beat 100bpm", withExtension: "mp3") {
         
            do {
            
                let audioFile = try AKAudioFile(forReading: audioFileUrl)
                let player = try AKAudioPlayer(file: audioFile) {
                    print("completion callback has been triggered !")
                }
                
                AudioKit.output = player
                AudioKit.start()
                player.play()
                
            } catch {
                NSLog("\(error)")
            }
        }
    }
}

