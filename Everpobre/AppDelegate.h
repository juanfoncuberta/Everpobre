//
//  AppDelegate.h
//  Everpobre
//
//  Created by Juan Foncuberta on 3/9/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFCSimpleCoreDataStack;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) JFCSimpleCoreDataStack *model;

@end

