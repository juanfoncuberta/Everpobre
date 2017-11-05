//
//  JFCNamedEntity+CoreDataProperties.m
//  Everpobre
//
//  Created by Juan Foncuberta on 5/11/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//
//

#import "JFCNamedEntity+CoreDataProperties.h"

@implementation JFCNamedEntity (CoreDataProperties)

+ (NSFetchRequest<JFCNamedEntity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"NamedEntity"];
}

@dynamic creationDate;
@dynamic modificationDate;
@dynamic name;

@end
