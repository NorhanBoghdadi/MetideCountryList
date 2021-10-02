//
//  HomeViewModel.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import UIKit
import CoreLocation

class HomeViewModel: ViewModel {
    
    var numberOfCountries: Int {
        countriesList.count
    }
    
    let metLocation = CLLocation(latitude: 45.5106775, longitude: 12.2321666)
    
    var viewController: DataLoaderController?
    
    var countriesList = [CountiresList]()
  
    let dataUrl = URL(string: "https://developer:metide@us-central1-job-interview-cfe5a.cloudfunctions.net/countries")
    
    init(viewController: DataLoaderController) {
        self.viewController = viewController
        DispatchQueue.main.async { [self] in
            viewController?.dataLoaded()
        }
        make(request: dataUrl!)
    }
    
    func data(for cellAt: IndexPath) -> CountiresList {
        countriesList[cellAt.row]
    }
    
    // MARK: - Networking functions
    
    func make(request withURL: URL) {
        let loginData = String(format: "%@:%@", "developer", "metide").data(using: String.Encoding.utf8)!
        let base64LoginData = loginData.base64EncodedString()
        var request = URLRequest(url: withURL)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginData)", forHTTPHeaderField: "Authorization")
        send(request: request)
    }
    
    func handle(respone: (Data?, URLResponse?, Error?))   {
        guard let data = respone.0 else { return }
        do {
            countriesList = try process(data: data)
            viewController??.dataLoaded()
        } catch {
             print(error.localizedDescription)
        }
    }
    
    func send(request: URLRequest) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: nil, delegateQueue:OperationQueue.main)
        let task = session.dataTask(with: request) {[weak self] (data, response, error) in
            self?.handle(respone: (data, response, error))
        }
        task.resume()
    }
    
    func process(data: Data) throws ->  [CountiresList] {
        let jsonData = try JSONDecoder().decode([CountiresList].self, from: data)
        return sort(arr: jsonData)
    }
    
    //MARK: - Calculate distance between country and the Metide Location
    func calculateDistance(country: CLLocation, office: CLLocation) -> Int {
         Int(country.distance(from: office))
    }
    //MARK: - Calculate Location coordiantes from set of strings.
    
    func getLocation(lat: String, long: String) -> CLLocation {

        CLLocation(latitude: Double(lat)!, longitude: Double(long)!)
        

    }
    

    
    //MARK: - Sorting the array geographiclly
    func sort(arr: [CountiresList]) -> [CountiresList] {
        return arr.sorted {

            calculateDistance(country: getLocation(lat: $0.latitude ?? "0.0", long: $0.longitude ?? "0.0"), office: metLocation) < calculateDistance(country: getLocation(lat: $1.latitude ?? "0.0", long: $1.longitude ?? "0.0"), office: metLocation)
        }
    }
    
    
}
