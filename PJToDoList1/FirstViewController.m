//
//  FirstViewController.m
//  PJToDoList1
//
//  Created by Mac on 04/11/16.
//  Copyright © 2016 Pragati Jawale. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    allTask =[[NSMutableArray alloc]init];
}

-(void)viewDidAppear:(BOOL)animated{
    [self reloadTask];
}
-(void)reloadTask {
    allTask = [[PJDataBaseManager sharedManager]getAllTask];
    
    if (allTask.count > 0) {
        [self.myTableView reloadData];
    }
    else {
        NSLog(@"No Task Fetched");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return  1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return allTask.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    NSString *taskString  = [allTask objectAtIndex:indexPath.row];
    
    NSLog(@"%@",taskString);
    
    cell.textLabel.text = taskString;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Delete");
    
    NSString *task = [allTask objectAtIndex:indexPath.row];
    
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM TASK_TABLE WHERE TASK_ID ='%@'",task.uppercaseString];
    
    if([[ PJDataBaseManager sharedManager]executeQuery:deleteQuery] == 1) {
        
        NSLog(@"Successfully Deleted");
        [self reloadTask];
    }
    else {
        NSLog(@"Failed To Delete Task");
    }
    


}

@end
