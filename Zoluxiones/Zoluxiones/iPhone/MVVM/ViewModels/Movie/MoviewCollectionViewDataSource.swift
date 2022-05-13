//
//  MoviewCollectionViewDataSource.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

class MoviewCollectionViewDataSource: NSObject {

    private var cellIdentifier : String!
    private var arrayMovie : [MovieBE]!
    var employeeSelect : (MovieCollectionViewCell, IndexPath) -> () = {_,_ in }
    var scrollBottom : Closures.Success = {}
    
    init(cellIdentifier : String, items : [MovieBE], configureCell : @escaping (MovieCollectionViewCell, IndexPath) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.arrayMovie =  items
        self.employeeSelect = configureCell
    }
    
}

extension MoviewCollectionViewDataSource: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate{
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! MovieCollectionViewCell
        cell.objBE = self.arrayMovie[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MovieCollectionViewCell else { return }
        self.employeeSelect(cell,indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfElements: CGFloat = 2
        let ancho = (UIScreen.main.bounds.width - (numberOfElements + 1) * 11) / numberOfElements
        return CGSize(width: ancho, height: 250)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            if ValidationNetwork.isConnectedToInternet{
                self.scrollBottom()
            }
        }
    }
}
