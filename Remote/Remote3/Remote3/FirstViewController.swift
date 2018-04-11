//
//  FirstViewController.swift
//  Remote3
//
//  Created by Andalcio, David on 3/7/18.
//  Copyright © 2018 Andalcio, David. All rights reserved.
//

import UIKit

var segTitle = ["FX", "TBS", "HBO", "CC"]
var segChannel = ["28", "12", "35", "40"]
var currentChannel: String = "1"
var volume : String = "50"

class FirstViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var changeChannelLabel: UILabel!
    
    @IBOutlet weak var powerSwitchW: UISwitch!
    @IBOutlet weak var volumeSliderW: UISlider!
    @IBOutlet weak var favChaSegmentW: UISegmentedControl!
    @IBOutlet var numberButtonW: [UIButton]!
    @IBOutlet var channelChangeButtonW: [UIButton]!
    
    var channelTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let greyColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        let blackColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        view.backgroundColor = greyColor
        for n in numberButtonW
        {
            n.backgroundColor = blackColor
        }
        for ccb in channelChangeButtonW
        {
            ccb.backgroundColor = blackColor
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favChaSegmentW.setTitle(segTitle[0], forSegmentAt: 0)
        favChaSegmentW.setTitle(segTitle[1], forSegmentAt: 1)
        favChaSegmentW.setTitle(segTitle[2], forSegmentAt: 2)
        favChaSegmentW.setTitle(segTitle[3], forSegmentAt: 3)
        channelLabel.text = currentChannel
        volumeLabel.text = volume
    }
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        powerLabel.text = (sender.isOn ? "On" : "Off")
        volumeLabel.text = (sender.isOn ? "\(Int(volumeSliderW.value))" : "")
        channelLabel.text = (sender.isOn ? "\(currentChannel)" : "")
        let enabled = (powerLabel.text == "On")
        volumeSliderW.isEnabled = enabled
        favChaSegmentW.isEnabled = enabled
        for n in numberButtonW
        {
            n.isEnabled = enabled
        }
        for ccb in channelChangeButtonW
        {
            ccb.isEnabled = enabled
        }
        
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        volumeLabel.text = "\(Int(sender.value))"
        volume = "\(Int(sender.value))"
    }
    
    @IBAction func favChaSegment(_ sender: UISegmentedControl) {
        let channel = sender.selectedSegmentIndex
            if(channel == 0)
            {
                currentChannel = segChannel[0]
                channelLabel.text = segChannel[0]
            }
            else if(channel == 1)
            {
                currentChannel = segChannel[1]
                channelLabel.text = segChannel[1]
            }
            else if(channel == 2)
            {
                currentChannel = segChannel[2]
                channelLabel.text = segChannel[2]
            }
            else if(channel == 3)
            {
                currentChannel = segChannel[3]
                channelLabel.text = segChannel[3]
            }
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        if let label = changeChannelLabel.text{
            if let title = sender.currentTitle{
                changeChannelLabel.text = label + title
                if(label.count == 1)
                {
                    let current = changeChannelLabel.text!
                    channelLabel.text = current
                    currentChannel = current
                    changeChannelLabel.text = ""
                }
            }
        }
        else{
            if let title = sender.currentTitle{
                changeChannelLabel.text = title
                channelTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(eraseChangeChannelLabel), userInfo: nil, repeats: false)
            }
        }
    }
    
    @objc func eraseChangeChannelLabel()
    {
        changeChannelLabel.text = ""
        channelTimer.invalidate()
    }
    
    @IBAction func channelChangeButton(_ sender: UIButton) {
        var curChan = Int(currentChannel)!
        if(sender.titleLabel?.text == "Ch +")
        {
            if(curChan < 99)
            {
                curChan = curChan + 1
            }
        }
        else
        {
            if(curChan > 1)
            {
                curChan = curChan - 1
            }
        }
        channelLabel.text = "\(curChan)"
    }


}

