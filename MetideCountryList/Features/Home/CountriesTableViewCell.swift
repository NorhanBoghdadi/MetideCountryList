//
//  TableViewCell.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/4/21.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var flagImg: UIImageView!
    var noteTextField: UITextField!
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left
        contentView.addSubview(nameLabel)
        
        flagImg = UIImageView()
        flagImg.translatesAutoresizingMaskIntoConstraints = false
        flagImg.isHidden = false
        flagImg.layer.cornerRadius = 7
        flagImg.clipsToBounds = true
        contentView.addSubview(flagImg)
        
        noteTextField = UITextField()
        noteTextField.translatesAutoresizingMaskIntoConstraints = false
        noteTextField.placeholder = "Enter Your notes"
        noteTextField.backgroundColor = UIColor(white: 1, alpha: 0.3)
        contentView.addSubview(noteTextField)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            flagImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImg.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            flagImg.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6)
        ])
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: flagImg.trailingAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width)/3),

        ])
        NSLayoutConstraint.activate([
            noteTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            noteTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            noteTextField.widthAnchor.constraint(equalToConstant: (contentView.frame.width)/2)

        ])
        
    }
    
    func configure(for countriesList: CountiresList) {
        try? flagImg.setImage(url: countriesList.flag, placeHolder: UIImage(named: "loading")!)
        nameLabel.text = countriesList.name
        noteTextField.text = countriesList.notes
        
        
    }
}
