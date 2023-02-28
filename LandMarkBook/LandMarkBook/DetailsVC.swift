//
//  DetailsVC.swift
//  LandMarkBook
//
//  Created by pc on 1.03.2023.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var landmarkLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var selectedMarkName = ""
    var selectedMarkImage = UIImage()
    
    
    override func viewDidLoad() {
        landmarkLabel.text = selectedMarkName
        imageView.image=selectedMarkImage
        
        
    }
    
    
    
    
}
