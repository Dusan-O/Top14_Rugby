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
    var segueId = "identifier"
    
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        allStadiums.forEach { stadium in
            let anno = StadiumAnnotation(stadium)
            map.addAnnotation(anno)
        }
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notificationObserver),
                                               name: Notification.Name("Center"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notificationObserver),
                                               name: Notification.Name("Detail"),
                                               object: nil)
    }
    
    
    @objc func notificationObserver(_ notification: Notification) {
        if let notif = notification.object as? MKCoordinateRegion {
            map.setRegion(notif, animated: true)
        } else if let notif = notification.object as? Club {
            performSegue(withIdentifier: segueId, sender: notif)
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
                view.update(annotation)
                return view
            }
            return MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: id)
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            if let next = segue.destination as? DetailViewController {
                next.club = sender as? Club
            }
        }
    }


}
