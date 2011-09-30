//
//  SNAPPicturesScrollViewContainer.m
//  wedding
//
//  Created by Ian Pointer on 9/30/11. (from original on 3/10/2010)
//  Copyright (c) 2011 Fallout Durham. All rights reserved.
//

#import "SNAPPicturesScrollViewContainer.h"

@implementation SNAPPicturesScrollViewContainer

@synthesize scrollView;

// Hard-coded pics - eep!

const CGFloat picHeight	= 420.0;
const CGFloat picWidth	= 320.0;
const NSUInteger weddingPicsNum		= 7;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Pictures", @"Pictures");
        self.tabBarItem.image = [UIImage imageNamed:@"pictures"];    }
    return self;
}

- (void)didReceiveMemoryWarning
{
     [super didReceiveMemoryWarning];
 
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    
    [scrollView setBackgroundColor:[UIColor blackColor]];
    
	[scrollView setCanCancelContentTouches:NO];
	scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrollView.clipsToBounds = YES;				
	scrollView.pagingEnabled = YES;
	
	NSUInteger i;
    
    // Grab the images and add the resulting imageViews to the subview
    
	for (i = 1; i <= weddingPicsNum; i++)
	{
		NSString *imageName = [NSString stringWithFormat:@"wedding%d.jpg", i];
		UIImage *image = [UIImage imageNamed:imageName];
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
		
				CGRect rect = imageView.frame;
		rect.size.height = picHeight;
		rect.size.width = picWidth;
		imageView.frame = rect;
		imageView.tag = i;			
        [scrollView addSubview:imageView];
		
	}
    
    // Having done that - we need to reposition them all so that they're horizontal
    // in the scrollView
    
    
    UIImageView *view = nil;
	NSArray *subviews = [scrollView subviews];
    
	
	CGFloat currentX = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(currentX, 0);
			view.frame = frame;
			
			currentX += (picWidth);
		}
	}
	
	// Set the content size (would be so much nicer if we could do this in IB
    
	[scrollView setContentSize:CGSizeMake((weddingPicsNum * picWidth), [scrollView bounds].size.height)];
		

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
