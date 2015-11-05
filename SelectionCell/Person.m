//
//  Person.m
//  SelectionCell
//
//  Created by Allan on 15/11/5.
//  Copyright © 2015年 Allan. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *) description
{
    NSLog(@"id is %d, name is %@", _userId, _userName);
    return _userName;
}

@end
