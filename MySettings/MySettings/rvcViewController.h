//
//  rvcViewController.h
//  MySettings
//
//  Created by Heather  on 4/5/13.
//  Copyright (c) 2013 Heather Pruitt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rvcViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UITextField *title;
    IBOutlet UITextField *comment;
    IBOutlet UIPickerView *eventLocation;

}
@property (nonatomic, retain) UITextField *title;
@property (nonatomic, retain) UITextField *comment;
@property (nonatomic, retain) UIPickerView *eventLocation;

-(IBAction) loadSettings: (id) sender;
-(IBAction) saveSettings: (id) sender;
-(IBAction) doneEditing: (id) sender;

@end
