//
//  JFCPhoto+CoreDataProperties.m
//  Everpobre
//
//  Created by Juan Foncuberta on 5/11/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//
//

#import "JFCPhoto+CoreDataProperties.h"

@implementation JFCPhoto (CoreDataProperties)

+ (NSFetchRequest<JFCPhoto *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Photo"];
}

@dynamic imageData;
@dynamic notes;

@end
