//
//  SecondViewController.h
//  PJToDoList1
//
//  Created by Mac on 04/11/16.
//  Copyright © 2016 Pragati Jawale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJDataBaseManager.h"
@interface SecondViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)saveButtonAction:(id)sender;


@end

