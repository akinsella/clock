//
//  ViewController.h
//  Clock
//
//  Created by Alexis Kinsella on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UILabel *hoursAndMinutesLabel;
    UILabel *secondsLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *hoursAndMinutesLabel;
@property (nonatomic, retain) IBOutlet UILabel *secondsLabel;

@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) NSTimer *walkTimer;



- (void)updateClock;
    
@end
