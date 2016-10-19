//
//  CoreLocationViewController.swift
//  ShapesCoreGrapgic
//
//  Created by don't touch me on 10/19/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class CoreLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationMgr = CLLocationManager()

    @IBAction func getLocation(_ sender: UIButton) {
        //1
        let status = CLLocationManager.authorizationStatus()
        
        //2
        if status == .notDetermined {
            locationMgr.requestWhenInUseAuthorization()
            
            return
        }
        //3
        if status == .denied || status == .restricted {
            
            let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location Services", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            
            return
        }
        //4
        locationMgr.delegate = self
        locationMgr.startUpdatingLocation()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    //1
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentLocation = locations.last!
        print("Current location: \(currentLocation)")
    }
    //2
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    
}
