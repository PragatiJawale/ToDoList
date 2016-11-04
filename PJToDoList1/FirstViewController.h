//
//  FirstViewController.h
//  PJToDoList1
//
//  Created by Mac on 04/11/16.
//  Copyright © 2016 Pragati Jawale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJDataBaseManager.h"
@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *allTask;
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@end

