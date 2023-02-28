//
//  ViewController.swift
//  LandMarkBook
//
//  Created by pc on 28.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var landmarkTowns = [String]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource=self
        tableView.delegate=self
        
        landmarkNames.append("Saat Kulesi")
        landmarkNames.append("Anıtkabir")
        landmarkNames.append("Van Gölü")
        landmarkNames.append("Peri Bacaları")
        landmarkNames.append("Galata")
        
        
        landmarkImages.append(UIImage(named: "izmirsaatkulesi")!)
        landmarkImages.append(UIImage(named: "anitkabir")!)
        landmarkImages.append(UIImage(named: "vangolu")!)
        landmarkImages.append(UIImage(named: "periBacalari")!)
        landmarkImages.append(UIImage(named: "galata")!)
        
        landmarkTowns.append("İzmir")
        landmarkTowns.append("Ankara")
        landmarkTowns.append("Van")
        landmarkTowns.append("Nevşehir")
        landmarkTowns.append("İstanbul")
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        content.secondaryText = landmarkTowns[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedMarkName = chosenLandmarkName
            destinationVC.selectedMarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    
}

