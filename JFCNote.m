//
//  JFCNote.m
//  Everpobre
//
//  Created by Juan Foncuberta on 14/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "JFCNote.h"



@interface JFCNote ()

+(NSArray *)observableKeyNames;

@end
@implementation JFCNote
+ (NSString*)entityName {
    return @"Note";
}
+(NSArray *)observableKeyNames{
    return  @[@"creationDate",@"name",@"notebook",@"photo"];
}

+(instancetype) noteWithName:(NSString *)name
                    notebook:(JFCNotebook *)notebook
                     context:(NSManagedObjectContext *)context{

    JFCNote *n = [NSEntityDescription insertNewObjectForEntityForName:@"Note"
                                               inManagedObjectContext:context];
    
    n.creationDate = [NSDate date];
    n.notebook = notebook;
    n.modificationDate = [NSDate date];
    n.name = name;

    return n;
}






@end
