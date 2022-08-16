//
//  StadiumAnnotations.swift
//  Top14_Rugby
//
//  Created by Dusan Orescanin on 16/08/2022.
//

import Foundation
import MapKit

class StadiumAnnotation: NSObject, MKAnnotation {
    var stadium: Stadium
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(_ stadium: Stadium) {
        self.stadium = stadium
        self.title = self.stadium.name
        self.coordinate = CLLocationCoordinate2D(latitude: self.stadium.lat, longitude: self.stadium.lon)
        self.subtitle = "Capacité: \(self.stadium.capacity) places"
    }
}
