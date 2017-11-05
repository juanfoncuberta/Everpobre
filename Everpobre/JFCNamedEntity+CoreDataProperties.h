//
//  JFCNamedEntity+CoreDataProperties.h
//  Everpobre
//
//  Created by Juan Foncuberta on 5/11/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//
//

#import "JFCNamedEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface JFCNamedEntity (CoreDataProperties)

+ (NSFetchRequest<JFCNamedEntity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *creationDate;
@property (nullable, nonatomic, copy) NSDate *modificationDate;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
