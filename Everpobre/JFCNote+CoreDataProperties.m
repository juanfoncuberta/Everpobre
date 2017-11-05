//
//  JFCNote+CoreDataProperties.m
//  Everpobre
//
//  Created by Juan Foncuberta on 5/11/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//
//

#import "JFCNote+CoreDataProperties.h"

@implementation JFCNote (CoreDataProperties)

+ (NSFetchRequest<JFCNote *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Note"];
}

@dynamic text;
@dynamic notebook;
@dynamic photo;

@end
