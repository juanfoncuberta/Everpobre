//
//  JFCNotebook+CoreDataProperties.m
//  Everpobre
//
//  Created by Juan Foncuberta on 5/11/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//
//

#import "JFCNotebook+CoreDataProperties.h"

@implementation JFCNotebook (CoreDataProperties)

+ (NSFetchRequest<JFCNotebook *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Notebook"];
}

@dynamic notes;

@end
