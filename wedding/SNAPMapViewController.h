//
//  SNAPMapViewController.h
//  wedding
//
//  Created by Ian Pointer on 9/29/11.
//  Copyright (c) 2011 Fallout Durham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>


@interface SNAPMapViewController : UIViewController <MKMapViewDelegate> {
    
    IBOutlet MKMapView *mapView;
  
}

@property (nonatomic, strong) MKMapView *mapView;


@end
