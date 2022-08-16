//
//  StadiumAnnotationView.swift
//  Top14_Rugby
//
//  Created by Dusan Orescanin on 16/08/2022.
//

import Foundation
import MapKit

class StadiumAnnotationView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        image = getImage()
        frame.size = CGSize(width: 25, height: 30)
        canShowCallout = true
    }
    
    func getImage() -> UIImage? {
        if let club = Datas.shared.allClubs.first(where: {$0.stadium.name == annotation?.title}) {
            return UIImage(named: club.nickname)
        }
        return nil
            
    }
}


