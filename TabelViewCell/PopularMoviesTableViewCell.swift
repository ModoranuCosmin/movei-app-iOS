
import UIKit

class PopularMoviesTableViewCell: UITableViewCell {
    
    
//    var movieList: [Movie] = []
    var titles : [Movie] = [Movie]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectionTitle: UILabel!
    static let identifier = "PopularMoviesTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "PopularMoviesTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(PopularMovieCollectionViewCell.nib(), forCellWithReuseIdentifier: PopularMovieCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    public func configure(sectionHeader:String,movieList: [Movie]){
//        self.movieList = movieList
//        selectionTitle.text = sectionHeader
//
//
//    }
    
    public func configureMovie(whit movies: [Movie],sectionHeader:String){
        self.titles = movies
        
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
            self?.selectionTitle.text = sectionHeader

        }
    }
    
    

}
extension PopularMoviesTableViewCell: UICollectionViewDelegate{
    
}

extension PopularMoviesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.identifier, for: indexPath) as! PopularMovieCollectionViewCell
        //cell.configure(movie: movieList[indexPath.row])
        
        guard let model = titles[indexPath.row].poster_path else {return UICollectionViewCell()}
        guard let title = titles[indexPath.row].original_title else {return UICollectionViewCell()}
        cell.configure(whit: model , title: title)
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//        switch indexPath.row {
//        case Section.Popular.rawValue:
//            return CGSize(width: 150.0, height: 250.0)
//        case Section.Upcoming.rawValue:
//            return CGSize(width: 200.0, height: 150.0)
//        case Section.Toprated.rawValue:
//            return CGSize(width: 250.0, height: 100.0)
//        default:
//            return CGSize(width: 150.0, height: 250.0)
//        }
//
//    }
}

