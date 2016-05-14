//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by Francesco Biegi on 14/05/16.
//  Copyright © 2016 Francesco Biegi. All rights reserved.
//

import UIKit

class MusicVideoDetailVC: UIViewController {
    
    var videos: Videos!
    
    @IBOutlet weak var vName: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var vGenre: UILabel!
    @IBOutlet weak var vPrice: UILabel!
    @IBOutlet weak var vRights: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MusicVideoDetailVC.preferredFontChanged), name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        preferredFontChanged()
        
        self.title = videos.vArtist

        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vRights.text = videos.vRights
        vGenre.text = videos.vGenre
        
        if videos.vImageData != nil {
            videoImage.image = UIImage(data: videos.vImageData!)
        } else {
            videoImage.image = UIImage(named: "imageNotAvailable")
        }
    }
    
    func preferredFontChanged() {
        print("The preferred font has changed on Detail")
        self.vName.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        self.vPrice.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        self.vRights.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        self.vGenre.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
}
