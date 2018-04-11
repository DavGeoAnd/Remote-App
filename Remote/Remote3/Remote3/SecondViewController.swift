//
//  SecondViewController.swift
//  Remote3
//
//  Created by Andalcio, David on 3/7/18.
//  Copyright © 2018 Andalcio, David. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet var stateButton: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let greyColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        let blackColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        view.backgroundColor = greyColor
        for n in stateButton
        {
            n.backgroundColor = blackColor
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func powerAction(_ sender: UISwitch) {
        powerLabel.text = (sender.isOn ? "On" : "Off")
        stateLabel.text = (sender.isOn ? "Stopped" : "")
        let enabled = (powerLabel.text == "On")
        for n in stateButton{
            n.isEnabled = enabled
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if let state = sender.currentTitle{
            if let currentState = stateLabel.text{
                if(state == "Play"){
                    if(currentState == "Stopped" || currentState == "Paused"){
                        stateLabel.text = "Playing"
                    }
                    else{
                        alertPopUp(state, currentState)
                    }
                }
                else if(state == "Stop"){
                    stateLabel.text = "Stopped"
                }
                else if(state == "Pause"){
                    if(currentState == "Playing"){
                        stateLabel.text = "Paused"
                    }
                    else{
                        alertPopUp(state, currentState)
                    }
                }
                else if(state == "Fast Forward"){
                    if(currentState == "Playing"){
                        stateLabel.text = "Fast Forwarding"
                    }
                    else{
                        alertPopUp(state, currentState)
                    }
                }
                else if(state == "Fast Rewind"){
                    if(currentState == "Playing"){
                        stateLabel.text = "Fast Rewinding"
                    }
                    else{
                        alertPopUp(state, currentState)
                    }
                }
                else{
                    if(currentState == "Stopped"){
                        stateLabel.text = "Recording"
                    }
                    else{
                        alertPopUp(state, currentState)
                    }
                }
            }
        }
    }
    
    func alertPopUp(_ state: String, _ currentState: String)
    {
        var message : String = ""
        if(state == currentState){
            message = "Already in " + currentState + " state"
        }
        else{
            message = "Can't change to " + state + " unless forced"
        }
        let alertController = UIAlertController(title: "Can't Perform State", message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Stay", style: .cancel, handler: nil)
        let changeAction = UIAlertAction(title: "Change", style: .default){
            _ in
            switch state {
            case "Play":
                self.stateLabel.text = "Playing"
                break
            case "Stop":
                self.stateLabel.text = "Stopped"
                break
            case "Pause":
                self.stateLabel.text = "Paused"
                break
            case "Fast Forward":
                self.stateLabel.text = "Fast Forwarding"
                break
            case "Fast Rewind":
                self.stateLabel.text = "Fast Rewinding"
                break
            default:
                self.stateLabel.text = "Recording"
                break
            }
            let alertController = UIAlertController(title: "State Change", message: "Your current state was changed to " + self.stateLabel.text!, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(changeAction)
        present(alertController, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}

