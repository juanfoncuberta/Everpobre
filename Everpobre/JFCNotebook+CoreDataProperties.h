//
//  JFCNotebook+CoreDataProperties.h
//  Everpobre
//
//  Created by Juan Foncuberta on 5/11/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//
//

#import "JFCNotebook+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface JFCNotebook (CoreDataProperties)

+ (NSFetchRequest<JFCNotebook *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSSet<JFCNote *> *notes;

@end

@interface JFCNotebook (CoreDataGeneratedAccessors)

- (void)addNotesObject:(JFCNote *)value;
- (void)removeNotesObject:(JFCNote *)value;
- (void)addNotes:(NSSet<JFCNote *> *)values;
- (void)removeNotes:(NSSet<JFCNote *> *)values;

@end

NS_ASSUME_NONNULL_END
