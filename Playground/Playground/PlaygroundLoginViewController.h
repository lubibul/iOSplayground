//
//  PlaygroundLoginViewController.h
//  Playground
//
//  Created by Lulu Tang on 2/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PlaygroundLoginViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
