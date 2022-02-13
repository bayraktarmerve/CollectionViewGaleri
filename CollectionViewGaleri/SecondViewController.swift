//
//  SecondViewController.swift
//  CollectionViewGaleri


import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imgGorsel: UIImageView!
    
  
    var secilenGorsel: Galeri!
    override func viewDidLoad() {
        super.viewDidLoad()

        imgGorsel.image = UIImage(named: secilenGorsel.resim)
    }
    
 
    

}
