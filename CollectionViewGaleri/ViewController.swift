//
//  ViewController.swift
//  CollectionViewGaleri
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet weak var cvList: UICollectionView!
    
    var galeriList : [Galeri] = []
    var secilenResim: Galeri!
    
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     cvList.register(UINib(nibName: "CVC_Galeri", bundle: nil), forCellWithReuseIdentifier: "CVC_Galeri")
        


        
        let gr1 = Galeri(resim: "image1")
        let gr2 = Galeri(resim: "image2")
        let gr3 = Galeri(resim: "image3")
        let gr4 = Galeri(resim: "image4")
        let gr5 = Galeri(resim: "image5")
        let gr6 = Galeri(resim: "image6")
        let gr7 = Galeri(resim: "image7")
        let gr8 = Galeri(resim: "image8")
        let gr9 = Galeri(resim: "image9")
        let gr10 = Galeri(resim:"image10")
        let gr11 = Galeri(resim: "image11")
        let gr12 = Galeri(resim: "image12")
        let gr13 = Galeri(resim: "image13")
        let gr14 = Galeri(resim: "image14")
        let gr15 = Galeri(resim: "image15")
        let gr16 = Galeri(resim: "image16")
        let gr17 = Galeri(resim: "image17")
        let gr18 = Galeri(resim: "image18")
        let gr19 = Galeri(resim: "image19")
        let gr20 = Galeri(resim: "image20")
       
        galeriList.append(gr1)
        galeriList.append(gr2)
        galeriList.append(gr3)
        galeriList.append(gr4)
        galeriList.append(gr5)
        galeriList.append(gr6)
        galeriList.append(gr7)
        galeriList.append(gr8)
        galeriList.append(gr9)
        galeriList.append(gr10)
        galeriList.append(gr11)
        galeriList.append(gr12)
        galeriList.append(gr13)
        galeriList.append(gr14)
        galeriList.append(gr15)
        galeriList.append(gr16)
        galeriList.append(gr17)
        galeriList.append(gr18)
        galeriList.append(gr19)
        galeriList.append(gr20)
   
        self.setupGridView()
    }
    
    func setupGridView(){
        let flow = cvList.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize - 14.0)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize - 14.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galeriList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC_Galeri", for: indexPath) as! CVC_Galeri
        let galeriİcerik = galeriList[indexPath.row]

        cell.ivResim.image = UIImage(named:galeriİcerik.resim)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        secilenResim = galeriList[indexPath.row]
        performSegue(withIdentifier: "sgDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController{
            vc.secilenGorsel = secilenResim
        }
      
    }
  
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = self.calculateWith()
        let height = width * 2/3
        return CGSize(width: width, height: height)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth =  CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
        
        
    }
}

