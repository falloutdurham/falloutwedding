//
//  SNAPMapViewController.m
//  wedding
//
//  Created by Ian Pointer on 9/29/11.(from original on 3/10/2010)
//  Copyright (c) 2011 Fallout Durham. All rights reserved.
//

#import "SNAPMapViewController.h"

@implementation SNAPMapViewController

@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map", @"Map");
        self.tabBarItem.image = [UIImage imageNamed:@"map"];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

// Load up the wedding registry page here, setting scaling (and thus enabling zoom

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

// Display the map of Durham

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Set up the map and zoom in, showing current location too
    
    mapView.showsUserLocation=YES;

    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 35.996015;
    zoomLocation.longitude = -78.90163;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 20, 20);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];                
    [mapView setRegion:adjustedRegion animated:YES];  
    
    
        
    // Add the pin for where the wedding is taking place
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(35.996015, -78.90163);
    annotation.title = @"The Pac-Man Wedding";
    annotation.subtitle = @"4/1/2010 18:30 @ The Green Wall ";
    [mapView addAnnotation:annotation];
       
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end