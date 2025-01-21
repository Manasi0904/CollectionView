//
//  ViewController.swift
//  CollectionView
//
//  Created by Kumari Mansi on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnForwardClick: UIBarButtonItem!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    let productTypeName: [String] = ["BED","TABLE","CHAIR","SOFA","XYZ","WWW","AAA","ABCD"]
    
    let productImages: [String] = ["bed","table","chair","sofa","XYZ","WWW","AAA","ABCD"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func myButtonTap(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstVC") as! FirstVC
        self.navigationController?.pushViewController(secondViewController, animated: true)    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productTypeName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.myImage.image = UIImage(named: productImages[indexPath.row])
        cell.myLabel.text = productTypeName[indexPath.row]
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.blue.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-20)/2
        return CGSize(width: size, height: size)
    }
}


