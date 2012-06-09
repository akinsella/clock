//
//  ViewController.m
//  Clock
//
//  Created by Alexis Kinsella on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dateFormatter;
@synthesize hoursAndMinutesLabel;
@synthesize secondsLabel;

-(void)updateClock {
    NSDate *currentDate = [[NSDate alloc] init];
    
    [dateFormatter setDateFormat:@"hh:mm"];
    self.hoursAndMinutesLabel.text = [dateFormatter stringFromDate:currentDate];
    [dateFormatter setDateFormat:@"ss"];
    self.secondsLabel.text = [dateFormatter stringFromDate:currentDate];
    
    // ARC forbids explicits release  
    // [currentDate release];
}

- (void) viewWillAppear:(BOOL)animated {
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 
                                             target:self 
                                           selector:@selector(updateClock) 
                                           userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    [self updateClock];
    
    [super viewWillAppear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter = dateFormatter;
    
    // [dateFormatter release];
    
    [self.dateFormatter setLocale:[NSLocale autoupdatingCurrentLocale]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.dateFormatter = nil;

    // Release any retained subviews of the main view.    
    self.hoursAndMinutesLabel = nil;
    self.secondsLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
