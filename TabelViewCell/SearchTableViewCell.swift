//
//  SearchTableViewCell.swift
//  MovieApp
//
//  Created by Modoranu Cosmin on 11.08.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    public var titles : [Movie] = [Movie]()
    @IBOutlet weak var collectionView: UICollectionView!
    static let identifier = "SearchTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "SearchTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(SearchCollectionViewCell.nib(), forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    public func configureMovie(whit movies: [Movie],sectionHeader:String){
        self.titles = movies
        
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()

        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
extension SearchTableViewCell: UICollectionViewDelegate{
    
}
extension SearchTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        //cell.configure(movie: movieList[indexPath.row])
        
        guard let model = titles[indexPath.row].poster_path else {return UICollectionViewCell()}
        guard let title = titles[indexPath.row].original_title else {return UICollectionViewCell()}
        
        cell.configure(whit: model , title: title)
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let itemWidth = collectionView.bounds.width
//            let itemHeight = collectionView.bounds.height
//            return CGSize(width: itemWidth, height: itemHeight)
//        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width: 250.0, height: 200.0)
          
        }
}
