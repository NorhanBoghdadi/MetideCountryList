//
//  HomeViewController.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import UIKit

class HomeViewController: UIViewController {

    let reuseIden = "table Iden"
    var viewModel: ViewModel?
    var countriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = HomeViewModel(viewController: self)
        
        countriesTableView = UITableView()
        countriesTableView.translatesAutoresizingMaskIntoConstraints = false
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIden)
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        view.addSubview(countriesTableView)
        
        setupConstraints()
    }
    //MARK: - Setup Constraints for the tableview.
    func setupConstraints() {
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countriesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            countriesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            countriesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }


}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel!.numberOfCountries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: reuseIden)
        cell!.layer.borderColor = UIColor(white: 0.7, alpha: 0.2).cgColor
        cell!.layer.borderWidth = 2
        cell!.layer.cornerRadius = 10
        cell!.backgroundColor = UIColor(white: 0.7, alpha: 0.2)
        cell!.textLabel?.textColor = .black
        
        let data = viewModel?.data(for: indexPath)
        cell?.textLabel?.text = data?.name
        return cell!
        
    }
    
    
}
extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: NotifaiableController {
    func dataLoaded() {
        countriesTableView.reloadData()
    }
    
}
extension HomeViewController: LoadableController {
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
    
    
}
