
import UIKit


class SearchViewController: UIViewController{
    
    var titles : [Movie] = [Movie]()
     let serachController = UISearchController()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = serachController
        tableView.register(SearchTableViewCell.nib(), forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
       // getPopularMovies()
        fetchDiscoverMovies()
        serachController.searchResultsUpdater = self
    }
    
    func fetchDiscoverMovies(){
        APICaller.shared.getDiscoverMovies {[weak self] result  in
            switch result{
            case .success(let titles):
                self?.titles = titles
                DispatchQueue .main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
extension SearchViewController: UITableViewDelegate{
    
}
extension SearchViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier , for: indexPath) as? SearchTableViewCell else { return UITableViewCell()}
        cell.configureMovie(whit: titles,sectionHeader: Movie.Section.TOPRATED.rawValue)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height
    }
}
 
extension SearchViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let query = searchBar.text,
                !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
              let resultsController = searchController.searchResultsController as? SearchViewController else { return}
                
        
        APICaller.shared.searchMovie(with: query) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let titles):
                    resultsController.titles = titles
                    resultsController.serachController.reloadInputViews()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
