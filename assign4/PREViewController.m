//
//  PREViewController.m
//  assign4
//
//  Created by Maclab03 on 5/13/15.
//  Copyright (c) 2015 LiptakLask. All rights reserved.
//

#import "PREViewController.h"

@interface PREViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nText;
@property (weak, nonatomic) IBOutlet UITextField *pText;
@property (weak, nonatomic) IBOutlet UILabel *nError;
@property (weak, nonatomic) IBOutlet UILabel *pError;

@end

@implementation PREViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	 _pError.text = @"" ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//***********************************************************************************
//  -Tell keyboard to go away; stop first responder status when Done is pressed; name field only
//***********************************************************************************

- (IBAction)textFieldDoneEditing:(id)sender {
    
    //auto-enable Return key checkbox is checked, so Done key is disabled until user types
    [sender resignFirstResponder];

    
}//end actionhandler

//***********************************************************************************
//  -Change the underlying class of View to UIControl, this allows the call of action methods to    View
//
//  -Tell fields to stop first responder status
//***********************************************************************************

- (IBAction)backgroundTap:(id)sender {
    
    NSString * phone = _pText.text;
    
    // validate the name and phone fields

    if ([self valPhone:phone]) 
	{
        [self.nText resignFirstResponder];
        [self.pText resignFirstResponder];
        _pError.text = @""; //set label to empty
    }
    
}//end background


//*************************************************************************************
//  Validate if a number is entered
//*************************************************************************************

-(BOOL)valPhone:(NSString*)phone{
	NSError *error = NULL; 
	
	NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:&error]; 
	NSRange inputRange = NSMakeRange(0, [phone length]); 
	NSArray *matches = [detector matchesInString:phone options:0 range:inputRange]; 
	
	// no match at all 
	if ([matches count] == 0) 
	{ 
		_pError.text = @"Please use a valid number format."; //set error label
		return false; 
	} 
	
	// found match but we need to check if it matched the whole string
	NSTextCheckingResult *result = (NSTextCheckingResult *)[matches objectAtIndex:0]; 
	
	if ([result resultType] == NSTextCheckingTypePhoneNumber 
		&& result.range.location == inputRange.location 
		&& result.range.length == inputRange.length) 
	{ // it matched the whole string 
		return true; 
		
	} else {
		_pError.text = @"Please use a valid number format."; //set error label
		return false;
	}
}//end valPhone

#define MAX_LENGTH 20

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length >= MAX_LENGTH && range.length == 0)
    {
    	return NO; // return NO to not change text
    }
    else
    {return YES;}
}
@end
