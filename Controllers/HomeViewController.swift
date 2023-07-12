

import UIKit


enum Section:Int{
case Popular = 0
case Upcoming = 1
case Toprated = 2
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PopularMoviesTableViewCell.nib(), forCellReuseIdentifier: PopularMoviesTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
       // getPopularMovies()
        
    }

    
//    private func getPopularMovies(){
//        APICaller.shared.getPopularMovies { results in
//            switch results{
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
}
extension HomeViewController: UITableViewDelegate{
        
    
}
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularMoviesTableViewCell.identifier, for: indexPath) as! PopularMoviesTableViewCell
        
        switch indexPath.row {
        case Section.Popular.rawValue:
            APICaller.shared.getPopularMovies {  result in
                switch result {
                case .success(let titles):
                    cell.configureMovie(whit: titles,sectionHeader: Movie.Section.POPULAR.rawValue)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Section.Upcoming.rawValue:
            APICaller.shared.getUpcomingMovies {  result in
                switch result {
                case .success(let titles):
                    cell.configureMovie(whit: titles,sectionHeader: Movie.Section.UPCOMING.rawValue)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Section.Toprated.rawValue:
            APICaller.shared.getTopRatedMovies{  result in
                switch result {
                case .success(let titles):
                    cell.configureMovie(whit: titles,sectionHeader: Movie.Section.TOPRATED.rawValue)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        
        
//        switch indexPath.row {
//        case 0:
//        cell.configure(sectionHeader: MovieManager.Section.POPULAR.rawValue, movieList: MovieManager.movies[MovieManager.Section.POPULAR] ?? [])
//        case 1:
//        cell.configure(sectionHeader: MovieManager.Section.UPCOMING.rawValue, movieList: MovieManager.movies[MovieManager.Section.UPCOMING] ?? [])
//        case 2:
//        cell.configure(sectionHeader: MovieManager.Section.TOPRATED.rawValue, movieList: MovieManager.movies[MovieManager.Section.TOPRATED] ?? [])
//        default:
//        cell.configure(sectionHeader: MovieManager.Section.POPULAR.rawValue, movieList: MovieManager.movies[MovieManager.Section.POPULAR] ?? [])
//
//        }
            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
        default:
            return 200
        }
    }

}

