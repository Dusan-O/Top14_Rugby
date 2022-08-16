//
//  MapViewController.swift
//  Top14_Rugby
//
//  Created by Dusan Orescanin on 16/08/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var allStadiums: [Stadium] = Datas.shared.allStadiums
    
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allStadiums.forEach { stadium in
            let anno = StadiumAnnotation(stadium)
            map.addAnnotation(anno)
        }
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
