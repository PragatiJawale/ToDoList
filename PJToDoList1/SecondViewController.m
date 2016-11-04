//
//  SecondViewController.m
//  PJToDoList1
//
//  Created by Mac on 04/11/16.
//  Copyright © 2016 Pragati Jawale. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveTask {
    
    NSString *task = self.myTextField.text;
    
    if (task.length > 0) {
        
        NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO TASK_TABLE(TASK_ID,TASK) VALUES ('%@','%@')",task.uppercaseString,task];
        
        NSLog(@"%@",insertQuery);
        //     NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO TASK_TABLE(TASK_ID,TASK) VALUES ('%@','%@')",task.uppercaseString,task];
        
        NSLog(@"%@",insertQuery);
        
        
        int result = [[PJDataBaseManager sharedManager]executeQuery:insertQuery];
        if (result == 1) {
            
            NSLog(@"Successfully inserted Task");
            
        }
        else {
            NSLog(@"Unable to insert task in SQLite DataBase");
            
        }
        NSLog(@"Task Saved : %@",task);
        
        self.myTextField.text = @" ";
        
    }
    else {
        NSLog(@"Enter Task first to Save");
        
    }
    
    [self.myTextField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    
    
    return YES;
}

- (IBAction)saveButtonAction:(id)sender {
    [self saveTask];
}
@end
