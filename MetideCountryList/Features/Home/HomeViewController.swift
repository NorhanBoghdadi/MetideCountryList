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
        countriesTableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: reuseIden)
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
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: reuseIden) as! CountriesTableViewCell
        
        guard let data = (viewModel?.data(for: indexPath)) else {return cell}

        cell.configure(for: data)
        
        if(cell.noteTextField.text != " ") {
            Database.shared.addNotes(for: cell.noteTextField.text!, at: indexPath.row)
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.frame.height) / 10
    }
    
    
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               
        sendData(indexPath: indexPath)
        
    }
}

//MARK: - Extension for the protocols.

extension HomeViewController: NotifaiableController {
    func dataLoaded() {
        countriesTableView.reloadData()
        
        refreshControl.endRefreshing()
    }
    
}
extension HomeViewController: TransferData {
    func sendData(indexPath: IndexPath) {
        let data = viewModel?.data(for: indexPath)
        let infoVC = InfoViewController()
        infoVC.countryName = data!.nameOfficial
        infoVC.flagUrl = data!.flag
        infoVC.countryLong = data!.longitude ?? " Location is not available."
        infoVC.countryLat = data!.latitude ?? " "
        present(infoVC, animated: true, completion: nil)
    }
    

}
