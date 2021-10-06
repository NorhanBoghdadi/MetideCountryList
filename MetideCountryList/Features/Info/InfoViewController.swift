//
//  InfoViewController.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/2/21.
//

import UIKit

class InfoViewController: UIViewController {

    //MARK: - Variables
    var flagUrl: String = " "
    var countryName: String = " "
    var countryLat: String = " "
    var countryLong: String = " "
    
    //MARK: - Views
    var flagImg: UIImageView!
    var nameLabel: UILabel!
    var locationLabel: UILabel!
    var countryLocation: UILabel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        let newTopView = UIView(frame: CGRect(x: 0, y: 0 , width: Int(view.frame.width), height: Int(view.frame.height) / 3 ))
        
        newTopView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        newTopView.layer.cornerRadius = 10
        view.addSubview(newTopView)
        
        flagImg = UIImageView()
        flagImg.frame = CGRect(x: 0, y: 0, width: (newTopView.frame.height) / 2, height: (newTopView.frame.height) / 2)
        flagImg.layer.cornerRadius = flagImg.layer.bounds.width / 2
        flagImg.center.x = newTopView.bounds.midX
        flagImg.center.y = newTopView.bounds.midY
        flagImg.clipsToBounds = true
        flagImg.contentMode = .scaleAspectFit
        flagImg.layer.borderColor = UIColor.darkGray.cgColor
        flagImg.layer.borderWidth = 2.0
        flagImg.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        try? flagImg.setImage(url: flagUrl, placeHolder: UIImage(named: "loading")!)
        newTopView.addSubview(flagImg)
        
        nameLabel = UILabel()
        nameLabel.text = countryName.uppercased()
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.frame = CGRect(x: 0, y: (newTopView.frame.height) * 0.7, width: newTopView.frame.width, height: 100)
        newTopView.addSubview(nameLabel)
        
        locationLabel = UILabel()
        locationLabel.text = "Country Location"
        locationLabel.textAlignment = .center
        locationLabel.textColor = .black
        locationLabel.font = .boldSystemFont(ofSize: 20)
        locationLabel.frame = CGRect(x: 0, y: (newTopView.frame.height), width: newTopView.frame.width, height: 100)
        view.addSubview(locationLabel)
        
        countryLocation = UILabel()
        countryLocation.text = "Country Location"
        countryLocation.textAlignment = .center
        countryLocation.textColor = .black
        countryLocation.text = "Latitude: " + countryLat + ", Longtitude: " + countryLong
        countryLocation.contentMode = .scaleAspectFit
        countryLocation.frame = CGRect(x: 0, y: (newTopView.frame.height) + 50, width: newTopView.frame.width, height: 100)
        view.addSubview(countryLocation)
        

    }
    

    
}
