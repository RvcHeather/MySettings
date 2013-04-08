//
//  rvcViewController.m
//  MySettings
//
//  Created by Heather  on 4/5/13.
//  Copyright (c) 2013 Heather Pruitt. All rights reserved.
//

#import "rvcViewController.h"

@interface rvcViewController ()

@end

@implementation rvcViewController

@synthesize title;
@synthesize comment;
@synthesize eventLocation;
NSMutableArray *location;
NSString *eventLocationSelected;

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}


- (void)viewDidLoad {
    
    location = [[NSMutableArray alloc] init];
    [location addObject:@"Home"];
    [location addObject:@"Work"];
    [location addObject:@"Other"];
    [super viewDidLoad];
}

//---number of components in the Picker view---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

//---number of items(rows) in the Picker view---
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [location count];
}

//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [location objectAtIndex:row];
}

//---the item selected by the user---
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    eventLocationSelected = [location objectAtIndex:row];
}

-(IBAction) loadSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    title.text = [defaults objectForKey:@"title"];
    comment.text = [defaults objectForKey:@"comment"];
    
    
    eventLocationSelected = [[NSString alloc] initWithString:
                             [defaults objectForKey:@"location"]];
    int selIndex = [location indexOfObject:eventLocationSelected];
    
    
    [eventLocation selectRow:selIndex inComponent:0 animated:YES];
}

-(IBAction) saveSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:title.text forKey:@"title"];
    [defaults setObject:comment.text forKey:@"comment"];
    [defaults setObject:eventLocationSelected forKey:@"location"];
    [defaults synchronize];
    
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Settings Value Saved"
                               message:@"Settings Saved"
                              delegate:nil
                     cancelButtonTitle:@"Done"
                     otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)dealloc {
    [location release];
    [eventLocationSelected release];
    [title release];
    [comment release];
    [location release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

