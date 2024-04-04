//
//  DescriptionViewController.swift
//  test_Ind3
//
//  Created by Rafael Silvar on 4/3/24.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    var getName = String()
    var getImage: UIImage?
    var getDescription = String()
    var getImage2: UIImage?
    
    
    @IBOutlet weak var theImage: UIImageView!
    
    
    @IBOutlet weak var theName: UILabel!
    
    @IBOutlet weak var theDescription: UILabel!
    
    @IBOutlet weak var theImage2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        theName.text = getName
        theImage.image = getImage
        theImage2.image = getImage2
        theDescription.text = getDescription
        
        
    }
    

 

}
