//
//  HomeViewController.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {

    let reuseIden = "table Iden"
    var viewModel: ViewModel?
    var countriesTableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = HomeViewModel(viewController: self)
        
        
        countriesTableView = UITableView()
        countriesTableView.translatesAutoresizingMaskIntoConstraints = false
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIden)
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        countriesTableView.accessibilityIdentifier = "table--countriesTableView"
        view.addSubview(countriesTableView)
        
        refreshControl.addTarget(self, action: #selector(refreshCountryList(_:)), for: .valueChanged)
        countriesTableView.addSubview(refreshControl)
        
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
    //MARK: - Pull-Refresh Func.
    @objc private func refreshCountryList(_ sender: Any) {
        dataLoaded()
    }
    


}
//MARK: - TableView DataSource& Delegate
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
        try? cell?.imageView?.setImage(url: data!.flag, placeHolder: UIImage(named: "loading")!)
        cell?.imageView?.contentMode = .scaleAspectFit
        cell?.imageView?.clipsToBounds = true
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.frame.height) / 10
    }
    
    
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        countriesTableView.deselectRow(at: indexPath, animated: true)
        
        let data = viewModel?.data(for: indexPath)
        let infoVC = InfoViewController()
        infoVC.countryName = data!.nameOfficial
        infoVC.flagUrl = data!.flag
        present(infoVC, animated: true, completion: nil)
    }
}

//MARK: - Extension for the protocols.

extension HomeViewController: NotifaiableController {
    func dataLoaded() {
        countriesTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
}
