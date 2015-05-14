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

//variables
bool flag1;
int num, len;
NSString * phone;

- (void)viewDidLoad
{
    [super viewDidLoad];
	 _pError.text = @"Don't use ""-"" or ""( )""" ;
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
    
    phone = _pText.text;
    
    // validate the name and phone fields
    [self valPhone:phone];

    if (flag1) {
        [self.nText resignFirstResponder];
        [self.pText resignFirstResponder];
        _pError.text = @""; //set label to empty
    }
    
}//end background


//*************************************************************************************
//  Validate if a number is entered
//*************************************************************************************

-(BOOL)valPhone:(NSString*)phone{

    len = [phone length];
    num = [phone intValue]; //if phone is not a proper integer it num = 0
    
    //check if the number is proper length (10)
    if (len > 10 || len < 10 || num == 0) {

        _pError.text = @"!Valid Number\nDon't use ""-"" or ""( )""" ;//set error label
        flag1 = false;
    }
    else{
        flag1 = true;
    }
    return flag1;

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
