
import UIKit
import SDWebImage
class PopularMovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "PopularMovieCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "PopularMovieCollectionViewCell", bundle: nil)
    }
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var textCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    func configure(whit model:String, title: String){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return}
        imageCell.contentMode = .scaleToFill
        imageCell.sd_setImage(with: url, completed: nil)
        self.textCell.text = title
        textCell.textAlignment = NSTextAlignment.center

        
    }
    
}
