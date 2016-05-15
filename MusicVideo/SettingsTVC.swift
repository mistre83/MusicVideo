//
//  SettingsTVC.swift
//  MusicVideo
//
//  Created by Francesco Biegi on 14/05/16.
//  Copyright © 2016 Francesco Biegi. All rights reserved.
//

import UIKit

class SettingsTVC: UITableViewController {

    @IBOutlet weak var abautDisplay: UILabel!
    @IBOutlet weak var feedbackDisplay: UILabel!
    @IBOutlet weak var securityDisplay: UILabel!
    @IBOutlet weak var touchID: UISwitch!
    @IBOutlet weak var bestImageDisplay: UILabel!
    @IBOutlet weak var APICnt: UILabel!
    @IBOutlet weak var sliderCnt: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SettingsTVC.preferredFontChanged), name: UIContentSizeCategoryDidChangeNotification, object: nil)

        tableView.alwaysBounceVertical = false
        
        title = "Settings"
        
        touchID.on = NSUserDefaults.standardUserDefaults().boolForKey("SecSettings")
       
    }
    
    @IBAction func touchIdSec(sender: UISwitch) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if self.touchID.on {
            defaults.setBool(touchID.on, forKey: "SecSettings")
        } else {
            defaults.setBool(false, forKey: "SecSettings")
        }
    }
    
    
    func preferredFontChanged() {
        abautDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        feedbackDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        securityDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        bestImageDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        APICnt.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

}
