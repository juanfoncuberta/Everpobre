//
//  JFCNotebook.m
//  Everpobre
//
//  Created by Juan Foncuberta on 14/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "JFCNotebook.h"
#import "JFCNote.h"

@interface JFCNotebook ()

+(NSArray *)observableKeyNames;

@end

@implementation JFCNotebook

+ (NSString*)entityName {
    return @"Notebook";
}
+(NSArray *)observableKeyNames{
    return  @[@"creationDate",@"name",@"notes"];
}
+(instancetype) notebookWithName:(NSString *)name
                         context:(NSManagedObjectContext *)context{


    JFCNotebook *nb = [NSEntityDescription insertNewObjectForEntityForName:@"Notebook"
                                                    inManagedObjectContext:context];
    nb.name = name;
    nb.creationDate =[NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
}


@end
