//
//  Person.h
//  SelectionCell
//
//  Created by Allan on 15/11/5.
//  Copyright © 2015年 Allan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, assign) int userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) BOOL isSelected;

@end
