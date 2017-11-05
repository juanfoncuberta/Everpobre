//
//  JFCNote+CoreDataProperties.h
//  Everpobre
//
//  Created by Juan Foncuberta on 5/11/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//
//

#import "JFCNote+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface JFCNote (CoreDataProperties)

+ (NSFetchRequest<JFCNote *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) JFCNotebook *notebook;
@property (nullable, nonatomic, retain) JFCPhoto *photo;

@end

NS_ASSUME_NONNULL_END
