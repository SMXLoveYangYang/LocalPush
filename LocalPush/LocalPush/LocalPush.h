//
//  LocalPush.h
//  LocalPush
//
//  Created by lanouhn on 2016/12/15.
//  Copyright © 2016年 SMX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalPush : NSObject

// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)alertTime;

+ (void) scheduleLocalNotification:(NSInteger)delayTime
                          userInfo:(NSDictionary *)userInfo;
//设置定时推送
+  (void)registerLocalNotification;
@end
