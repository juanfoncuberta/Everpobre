//
//  JFCPhoto.m
//  Everpobre
//
//  Created by Juan Foncuberta on 14/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "JFCPhoto.h"
#import "JFCNote.h"

@implementation JFCPhoto

//@synthesize image = _image;

#pragma mark -properties

-(void)setImage:(UIImage *)image{

    
    //guardarmos en variable instancia
   // _image = image;
    
    //sincronizar con imageData
    self.imageData = UIImagePNGRepresentation(image);

}

-(UIImage *)image{

   // if(_image ==nil){
     //   _image = [UIImage imageWithData:self.imageData];
   // }
    //return _image;
    
    return [UIImage imageWithData:self.imageData];

}
#pragma mark -class methods
+(instancetype) photoWithImage:(UIImage *)image
                       context:(NSManagedObjectContext *)context{

    JFCPhoto *p= [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];
    
    p.imageData = UIImageJPEGRepresentation(image, 0.9);
    
    
    //Alta en notificacion de memoria
    
  /*  NSNotificationCenter *nc =[NSNotificationCenter defaultCenter];
    [nc addObserver:p
           selector:@selector(notifyThatDidReceiveMemoryWarning:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
   */
    
    return p;
}


#pragma mark - notifications
/*
-(void) notifyThatDidReceiveMemoryWarning:(NSNotification *) notification{

    _image = nil;

}


#pragma mark - Lifecycle

-(void)dealloc{

    //baja en la notification
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];

}*/
@end
