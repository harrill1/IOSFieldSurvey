//
//  ObservationsViewController.swift
//  Field Survey
//
//  Created by Hayden on 7/16/18.
//  Copyright © 2018 Harrill, Hayden. All rights reserved.
//

import UIKit

class ObservationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let observations = ObservationsJSONParser.load(FileName: "field_observations")
    
    let dateFormatter = DateFormatter()

    @IBOutlet weak var observationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        self.title = "Field Survey"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObservationCell", for: indexPath)
        
        if let cell = cell as? ObservationTableViewCell {
            let observation = observations[indexPath.row]
            
            cell.classificationIconImageView.image = observation.classification.image
            cell.titleLabel.text = observation.title
            cell.dateLabel.text = dateFormatter.string(from: observation.date)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationDetailViewController,
           let row = observationsTableView.indexPathForSelectedRow?.row {
                destination.observation = observations[row]
            }
            
        
    }
    

}
