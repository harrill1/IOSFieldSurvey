//
//  ObservationDetailViewController.swift
//  Field Survey
//
//  Created by Hayden on 7/16/18.
//  Copyright © 2018 Harrill, Hayden. All rights reserved.
//

import UIKit

class ObservationDetailViewController: UIViewController {

    var observation: Observation?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var observationImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        observationImageView.image = observation?.classification.image
        titleLabel.text = observation?.title
        descriptionLabel.text = observation?.title
        
        if let date = observation?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
        }
        
        self.title = "Observation"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
