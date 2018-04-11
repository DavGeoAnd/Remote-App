//
//  ThirdViewController.swift
//  Remote3
//
//  Created by Andalcio, David on 3/7/18.
//  Copyright © 2018 Andalcio, David. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var buttonSegmentOutlet: UISegmentedControl!
    @IBOutlet weak var labelTextFieldOutlet: UITextField!
    @IBOutlet weak var channelLabelOutlet: UILabel!
    @IBOutlet weak var channelStepperOutlet: UIStepper!
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let greyColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        let blackColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        view.backgroundColor = greyColor
        cancelButtonOutlet.backgroundColor = blackColor
        saveButtonOutlet.backgroundColor = blackColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func channelStepperAction(_ sender: UIStepper) {
        var temp = String(sender.value).split(separator: ".")
        channelLabelOutlet.text = String(temp[0])
    }
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        labelTextFieldOutlet.text = ""
        channelLabelOutlet.text = "1"
        channelStepperOutlet.value = 1
    }

    @IBAction func saveButtonAction(_ sender: UIButton) {
        if let label = labelTextFieldOutlet.text{
            if(label.count > 4 || label.count < 1)
            {
                let alertController = UIAlertController(title: "Channel Config", message: "Channel Abbreviation Length is out of range", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Change", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else
            {
                if let channel = channelLabelOutlet.text
                {
                    var temp = channel.split(separator: ".")
                    let channelNumber = Int(temp[0])
                    if(channelNumber! < 1 || channelNumber! > 99)
                    {
                        let alertController = UIAlertController(title: "Channel Config", message: "Channel Number is out of range", preferredStyle: .alert)
                        let cancelAction = UIAlertAction(title: "Change", style: .cancel, handler: nil)
                        alertController.addAction(cancelAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                    else
                    {
                        let segIndex = buttonSegmentOutlet.selectedSegmentIndex
                        segTitle[segIndex] = label
                        segChannel[segIndex] = String(temp[0])
                        let alertController = UIAlertController(title: "Channel Config", message: "Favorite Channel has been changed", preferredStyle: .alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alertController.addAction(cancelAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
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
