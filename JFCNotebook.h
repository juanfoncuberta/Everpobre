//
//  JFCNotebook.h
//  Everpobre
//
//  Created by Juan Foncuberta on 14/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "_JFCNotebook.h"
//#import "JFCNotebook+CoreDataClass.h"

@class JFCNote;

NS_ASSUME_NONNULL_BEGIN

@interface JFCNotebook : _JFCNotebook{}

// Insert code here to declare functionality of your managed object subclass


+(instancetype) notebookWithName:(NSString *)name context:(NSManagedObjectContext *)context;
+ (NSString*)entityName;
@end

NS_ASSUME_NONNULL_END

//#import "JFCNotebook+CoreDataProperties.h"
