import UIKit

enum CellState {
    case expanded
    case collapsed
}

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 3
        }
    }
    @IBOutlet weak var dateLabel:UILabel!

//    func setItem(item: RSSItem) {
//        titleLabel.text = item.title
//        descriptionLabel.text = item.description
//        dateLabel.text = item.pubDate
//    }
//
    
    var item: RSSItem! {
        didSet {
            titleLabel.text = item.title
            descriptionLabel.text = item.description
            dateLabel.text = item.pubDate
        }
    }
}












