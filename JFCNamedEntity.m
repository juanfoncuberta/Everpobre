//
//  JFCNamedEntity.m
//  Everpobre
//
//  Created by Juan Foncuberta on 14/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "JFCNamedEntity.h"


@interface  JFCNamedEntity()

+(NSArray *)observableKeyNames;

@end

@implementation JFCNamedEntity 



/*+ (NSString*)entityName {
    return @"NamedEntity";
}*/
#pragma  mark - KVO
+(NSArray *)observableKeyNames{

    return @[@"name",@"creationDate"];
}
-(void)setupKVO{
    
    
    for(NSString *key in [[self class] observableKeyNames]){
        
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
        
        
    }
    
}


-(void)tearDownKVO{
    
    for(NSString *key in [[self class]  observableKeyNames]){
        
        [self removeObserver:self
                  forKeyPath:key];
    }
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSString *,id> *)change
                      context:(void *)context{
    
    
    self.modificationDate = [NSDate date];
    
    
    
    
}



#pragma  mark - lifeCycle

-(void)awakeFromInsert{
    
    [super awakeFromInsert];
    [self setupKVO];
    
    
}

-(void)awakeFromFetch{
    
    [super awakeFromFetch];
    [self setupKVO];
}


-(void)willTurnIntoFault{
    
    [super willTurnIntoFault];
    [self tearDownKVO];
    
}


@end
