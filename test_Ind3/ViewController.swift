//
//  ViewController.swift
//  test_Ind3
//
//  Created by Rafael Silvar on 4/2/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray: [(name: String, subtitle: String)] = [] // Array for State name and Nickname
    var imageArray: [UIImage] = []  // Array to hold state map images
    var flagArray: [UIImage] = [] // Array to hold flag images
    var descriptionArray: [String] = []  // Array to input Area
    
    // Function to get area for each state
    // URL for reference used: https://state.1keydata.com/states-by-size.php
    func getAreaForState(_ state: String) -> String? {
        switch state {
            case "Alabama": return "50,744"
            case "Alaska": return "571,951"
            case "Arizona": return "113,635"
            case "Arkansas": return "52,068"
            case "California": return "155,959"
            case "Colorado": return "103,718"
            case "Connecticut": return "4,845"
            case "Delaware": return "1,954"
            case "Florida": return "53,927"
            case "Georgia": return "57,906"
            case "Hawaii": return "6,423"
            case "Idaho": return "82,747"
            case "Illinois": return "55,584"
            case "Indiana": return "35,867"
            case "Iowa": return "55,869"
            case "Kansas": return "81,815"
            case "Kentucky": return "39,728"
            case "Louisiana": return "43,562"
            case "Maine": return "30,862"
            case "Maryland": return "9,774"
            case "Massachusetts": return "7,840"
            case "Michigan": return "56,804"
            case "Minnesota": return "86,936"
            case "Mississippi": return "79,610"
            case "Missouri": return "68,886"
            case "Montana": return "145,552"
            case "Nebraska": return "76,872"
            case "Nevada": return "109,826"
            case "New Hampshire": return "8,968"
            case "New Jersey": return "7,417"
            case "New Mexico": return "121,356"
            case "New York": return "47,214"
            case "North Carolina": return "48,711"
            case "North Dakota": return "68,976"
            case "Ohio": return "40,948"
            case "Oklahoma": return "68,667"
            case "Oregon": return "95,997"
            case "Pennsylvania": return "44,817"
            case "Rhode Island": return "1,045"
            case "South Carolina": return "30,110"
            case "South Dakota": return "75,885"
            case "Tennessee": return "41,217"
            case "Texas": return "261,797"
            case "Utah": return "82,747"
            case "Vermont": return "9,250"
            case "Virginia": return "39,594"
            case "Washington": return "66,544"
            case "West Virginia": return "24,078"
            case "Wisconsin": return "54,310"
            case "Wyoming": return "97,100"
            default: return nil
        }
    }
    
    // Function to load flag images based on state name
    // URL for reference used: https://ballotpedia.org/List_of_US_state_flags_and_territories
    func loadFlagImages() {
        for state in dataArray {
            // Constructing image name based on state name
            let imageName = "Flag_of_\(state.name.replacingOccurrences(of: " ", with: "_"))"
            if let flagImage = UIImage(named: imageName) {
                flagArray.append(flagImage)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = dataArray[indexPath.row].name
        cell.detailTextLabel?.text = dataArray[indexPath.row].subtitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let dvc = storyboard.instantiateViewController(withIdentifier: "DescriptionViewController") as? DescriptionViewController {
            
            // Passing state map image and flag image to DescriptionViewController
            dvc.getImage = imageArray[indexPath.row]
            dvc.getImage2 = flagArray[indexPath.row] // Passes the flag image
            dvc.getName = dataArray[indexPath.row].name
            dvc.getDescription = "Area: \(descriptionArray[indexPath.row]) Sq. Miles"
            
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DataArray with tuples of names and subtitles
        // URL for reference used: https://www.50states.com/nickname.htm
        dataArray = [
            ("Alabama",    "The Yellowhammer State"),
            ("Alaska",     "The Last Frontier"),
            ("Arizona",    "The Grand Canyon State"),
            ("Arkansas",   "The Natural State"),
            ("California", "The Golden State"),
            ("Colorado",   "The Centennial State"),
            ("Connecticut","The Constitution State"),
            ("Delaware",   "The First State"),
            ("Florida",    "The Sunshine State"),
            ("Georgia",    "The Peach State"),
            ("Hawaii",     "The Aloha State"),
            ("Idaho",      "The Gem State"),
            ("Illinois",   "The Prairie State"),
            ("Indiana",    "The Hoosier State"),
            ("Iowa",       "The Hawkeye State"),
            ("Kansas",     "The Sunflower State"),
            ("Kentucky",   "The Bluegrass State"),
            ("Louisiana",  "The Pelican State"),
            ("Maine",      "The Pine Tree State"),
            ("Maryland",   "The Old Line State"),
            ("Massachusetts", "The Bay State"),
            ("Michigan",   "The Great Lakes State"),
            ("Minnesota",  "The North Star State"),
            ("Mississippi","The Magnolia State"),
            ("Missouri",   "The Show Me State"),
            ("Montana",    "The Treasure State"),
            ("Nebraska",   "The Cornhusker State"),
            ("Nevada",     "The Silver State"),
            ("New Hampshire", "The Granite State"),
            ("New Jersey", "The Garden State"),
            ("New Mexico", "The Land of Enchantment"),
            ("New York",   "The Empire State"),
            ("North Carolina", "The Tar Heel State"),
            ("North Dakota", "The Peace Garden State"),
            ("Ohio",       "The Buckeye State"),
            ("Oklahoma",   "The Sooner State"),
            ("Oregon",     "The Beaver State"),
            ("Pennsylvania", "The Keystone State"),
            ("Rhode Island", "The Ocean State"),
            ("South Carolina", "The Palmetto State"),
            ("South Dakota", "The Mount Rushmore State"),
            ("Tennessee",   "The Volunteer State"),
            ("Texas",       "The Lone Star State"),
            ("Utah",        "The Beehive State"),
            ("Vermont",     "The Green Mountain State"),
            ("Virginia",    "The Old Dominion"),
            ("Washington",  "The Evergreen State"),
            ("West Virginia", "The Mountain State"),
            ("Wisconsin",   "The Badger State"),
            ("Wyoming",     "The Equality State")
        ]
        
        // ImageArray with state map images
        for state in dataArray {
            let imageName = "\(state.name.replacingOccurrences(of: " ", with: ""))Map"
            if let image = UIImage(named: imageName) {
                imageArray.append(image)
            }
        }
        
        // DescriptionArray with areas for each state
        for state in dataArray {
            if let area = getAreaForState(state.name) {
                descriptionArray.append(area)
            }
        }
        
        // Load flag images
        loadFlagImages()
    }
}





