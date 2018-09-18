import UIKit

class NewsTableViewController: UITableViewController
{
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    private var rssItems: [RSSItem]?
    private var cellStates: [CellState]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 155.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        fetchData()
        sideMenus()
    }
    func sideMenus() {
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 200
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        }
    }
    
    private func fetchData()
    {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: "https://intranet.birmingham.ac.uk/student/news/index.aspx?NewsListing_SyndicationType=1") { (rssItems) in
            self.rssItems = rssItems
            self.cellStates = Array(repeating: .collapsed, count: rssItems.count)
            
            OperationQueue.main.addOperation {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "MasterToDetail" {
            let destVC = segue.destination as! DisplayViewController
            destVC.item = sender as? RSSItem
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let rssItems = rssItems else {
            return 0
        }
        
        // rssItems
        return rssItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        cell.item = rssItems?[indexPath.item]
//        if let item = rssItems?[indexPath.item] {
//            cell.item = item
//            cell.selectionStyle = .none
//
//            if let cellStates = cellStates {
//                cell.descriptionLabel.numberOfLines = (cellStates[indexPath.row] == .expanded) ? 0 : 4
//            }
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        //let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell
        let cell = rssItems![indexPath.row]
        performSegue(withIdentifier: "MasterToDetail", sender: cell)
        
        //performSegue(withIdentifier: "MasterToDetail", sender: cell)
    
        
//        tableView.beginUpdates()
//        cell.descriptionLabel.numberOfLines = (cell.descriptionLabel.numberOfLines == 0) ? 3 : 0
//
//        cellStates?[indexPath.row] = (cell.descriptionLabel.numberOfLines == 0) ? .expanded : .collapsed
//
//        tableView.endUpdates()
        
        
    }
    
}

















