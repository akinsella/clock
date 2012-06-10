//
//  ViewController.m
//  Clock
//
//  Created by Alexis Kinsella on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize hoursAndMinutesLabel;
@synthesize secondsLabel;
@synthesize walkTimer;
@synthesize dateFormatter;

-(void)updateClock {
    NSDate *currentDate = [[NSDate alloc] init];
    
    [self.dateFormatter setDateFormat:@"hh:mm"];
    self.hoursAndMinutesLabel.text = [self.dateFormatter stringFromDate:currentDate];
    [self.dateFormatter setDateFormat:@"ss"];
    self.secondsLabel.text = [self.dateFormatter stringFromDate:currentDate];
    
    // ARC forbids explicits release  
    // [currentDate release];
}

- (void) viewWillAppear:(BOOL)animated {
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 
                                             target:self 
                                           selector:@selector(updateClock) 
                                           userInfo:nil repeats:YES];
    [self setWalkTimer: timer];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    [self updateClock];
    
    [super viewWillAppear:animated];
}

- (void) viewDidDisappear:(BOOL)animated {
    [[self walkTimer] invalidate];
    [self setWalkTimer:nil]; 
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    [self setDateFormatter: df];
    
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
