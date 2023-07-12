

import UIKit
import SDWebImage
class SearchCollectionViewCell: UICollectionViewCell {

    
    static let identifier = "SearchCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "SearchCollectionViewCell", bundle: nil)
    }
    @IBOutlet weak var textCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(whit model:String, title: String){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return}
        imageCell.contentMode = .scaleAspectFit
        imageCell.sd_setImage(with: url, completed: nil)
        self.textCell.text = title
      

        
    }
}
