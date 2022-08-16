//
//  MapViewController.swift
//  Top14_Rugby
//
//  Created by Dusan Orescanin on 16/08/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    var allStadiums: [Stadium] = Datas.shared.allStadiums
    
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        allStadiums.forEach { stadium in
            let anno = StadiumAnnotation(stadium)
            map.addAnnotation(anno)
        }
    }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            let id = "ID"
            var view: StadiumAnnotationView
            if let anno = annotation as? StadiumAnnotation {
                if let d = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? StadiumAnnotationView {
                    d.annotation = anno
                    view = d
                } else {
                    view = StadiumAnnotationView(annotation: annotation, reuseIdentifier: id)
                }
                return view
            }
            return MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: id)
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
