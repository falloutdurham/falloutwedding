//
//  SNAPRegistryController.m
//  wedding
//
//  Created by Ian Pointer on 9/29/11.(from original on 3/10/2010)
//  Copyright (c) 2011 Fallout Durham. All rights reserved.
//

#import "SNAPRegistryController.h"

@implementation SNAPRegistryController

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Registry", @"Registry");
        self.tabBarItem.image = [UIImage imageNamed:@"registry"];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}

#pragma mark - View lifecycle

// Load up the wedding registry page here, setting scaling (and thus enabling zoom)

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *urlAddress = @"http://www.amazon.com/gp/registry/wedding/3AZISGB6VIY6Z";
    
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    webView.scalesPageToFit = YES;
    [webView loadRequest:requestObj];
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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