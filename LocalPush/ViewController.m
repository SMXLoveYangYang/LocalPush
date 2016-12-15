//
//  ViewController.m
//  LocalPush
//
//  Created by lanouhn on 2016/12/15.
//  Copyright © 2016年 SMX. All rights reserved.
//

#import "ViewController.h"

#import <Foundation/Foundation.h>

#import "LocalPush.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"本地通知";
    //定时推送
    [self registerLocalNotification];
}

- (IBAction)LocalPushBtnAction:(UIButton *)sender {
    

//    [self registerLocalNotification:3]; //3s后开启通知
    
//    [self scheduleLocalNotification:3 userInfo:@{@"content":@"学习 iOS 2年多了"}];
//    [self scheduleLocalNotification:4 userInfo:@{@"content":@"学习 java 2年多了"}];
//    [self scheduleLocalNotification:5 userInfo:@{@"content":@"学习 H5 2年多了"}];
    
//    [LocalPush registerLocalNotification:3];
//    [LocalPush scheduleLocalNotification:3 userInfo:@{@"content":@"学习iOS2年多了"}];
    
}

// 设置本地通知
-  (void)registerLocalNotification{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //定时推送：时间注意，Since1970得到的是格林时间早上八点，需要几点通知算一下，如下1*60*60代表延后1个小时也就是早上9点推送
    NSDate *fireDate = [NSDate dateWithTimeIntervalSince1970: (7*60*60 + 60)];
    
    notification.fireDate = fireDate;
    // 时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitSecond;
    
    // 通知内容
    notification.alertBody =  @"定时推送";
    notification.applicationIconBadgeNumber += 1;
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 通知参数
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"可以当闹钟使用哈" forKey:@"content"];
    notification.userInfo = userDict;
    
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSCalendarUnitDay;
    } else {
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSDayCalendarUnit;
    }
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}


// 设置本地通知
-  (void)registerLocalNotification:(NSInteger)alertTime {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 设置触发通知的时间
//    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:alertTime];
//    NSLog(@"fireDate=%@",fireDate);
    
    //定时推送：时间注意，Since1970得到的是格林时间早上八点，需要几点通知算一下，如下1*60*60代表延后1个小时也就是早上9点推送
    NSDate *fireDate = [NSDate dateWithTimeIntervalSince1970: 1*60*60];
    
    notification.fireDate = fireDate;
    // 时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitSecond;
    
    // 通知内容
    notification.alertBody =  @"该起床了...";
    notification.applicationIconBadgeNumber += 1;
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 通知参数
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"开始学习iOS开发了" forKey:@"content"];
    notification.userInfo = userDict;
    
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSCalendarUnitDay;
    } else {
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSDayCalendarUnit;
    }
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void) scheduleLocalNotification:(NSInteger)delayTime
                          userInfo:(NSDictionary *)userInfo{
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:delayTime];
    notification.fireDate = fireDate;
    
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.repeatInterval = NSCalendarUnitMinute;
    
    notification.alertBody = @"这是一条本地通知";
    notification.applicationIconBadgeNumber += 1;
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.userInfo = userInfo;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
 
}


@end
