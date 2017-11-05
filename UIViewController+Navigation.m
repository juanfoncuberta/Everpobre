//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Juan Foncuberta on 21/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *)wrappedInNavigation{


    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:self];
    return nav;
}
@end
