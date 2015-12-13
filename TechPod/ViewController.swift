//
//  ViewController.swift
//  TechPod
//
//  Created by 岡本　隆誠 on 2015/11/29.
//  Copyright © 2015年 岡本　隆誠. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String] ()
    
    var fileNameArray = [String] ()
    
    var imageNameArray = [String] ()
    
    var audioPlayer: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
    
        
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        
        fileNameArray = ["cannon","elise","aria"]
        
        imageNameArray  = ["pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return songNameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        
        cell.textLabel?.text = songNameArray[indexPath.row]
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました", songNameArray[indexPath.row])
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioPlayer = try? AVAudioPlayer(contentsOfURL: audioPath)
        
        audioPlayer.play()
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}

