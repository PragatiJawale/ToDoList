//
//  PJDataBaseManager.h
//  PJToDoList1
//
//  Created by Mac on 04/11/16.
//  Copyright © 2016 Pragati Jawale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface PJDataBaseManager : NSObject
{
    sqlite3 *myDB;
}
+(instancetype)sharedManager;
-(NSString *)getDatabasePath;
-(int)executeQuery :(NSString *)query;
-(NSMutableArray *)getAllTask;
@end
