//
//  AppDelegate.m
//  Everpobre
//
//  Created by Juan Foncuberta on 3/9/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "AppDelegate.h"
#import "JFCSimpleCoreDataStack.h"
#import "JFCNote.h"
#import "JFCNotebook.h"
#import "Settings.h"
#import "JFCNotebooksViewController.h"
#import "UIViewController+Navigation.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Crear instancia de stack de core data
    
    self.model = [JFCSimpleCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self trastearConDatos];
    
    [self autoSave];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JFCNotebook entityName]];
    
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JFCNamedEntityAttributes.modificationDate
                                                            ascending:NO],
                              [NSSortDescriptor sortDescriptorWithKey:JFCNamedEntityAttributes.name
                                                            ascending:YES]];
    
    NSFetchedResultsController *results = [[NSFetchedResultsController alloc]initWithFetchRequest:req
                                                                             managedObjectContext:self.model.context
                                                                               sectionNameKeyPath:nil
                                                                                        cacheName:nil];
    
    JFCNotebooksViewController *nbVC = [[JFCNotebooksViewController alloc]initWithFetchedResultsController: results
                                                                                                     style:UITableViewStylePlain];
    
  
    self.window.rootViewController = [nbVC wrappedInNavigation];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
 
    [self save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    [self save];

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    NSLog(@"Adios mundo cruel");
}

-(void)trastearConDatos{

    JFCNotebook *nb = [JFCNotebook notebookWithName:@"nb"
                                             context:self.model.context];
    
   JFCNote *ralalallalalalalala =  [JFCNote noteWithName:@"notaaaaaaaaaaaaaaaaaaaaaaaaaaaa1"
                 notebook:nb
                  context:self.model.context];
    
/*JFCNote *n2 = [JFCNote noteWithName:@"nota2"
                 notebook:nb
                  context:self.model.context];*/
    
    
    NSFetchRequest *req = [[NSFetchRequest alloc]initWithEntityName:@"Note"];
    
    
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JFCNamedEntityAttributes.name ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:JFCNamedEntityAttributes.modificationDate ascending:NO]];
    
    NSError *error = nil;
    
    NSArray *results = [self.model.context executeFetchRequest:req
                                                         error:&error];
    
    
    if(results ==nil){
        NSLog(@"Error al buscaaaaaaaaaaaaaaaaaaaar %@",results);
    }else{
    
        NSLog(@"Resultssssssssssssssssssssssssssss: %@",results);
    }
  
    [self save];
    
    [self.model.context deleteObject:ralalallalalalalala];
  
    
    
    

}

-(void)save{


    [self.model saveWithErrorBlock:^(NSError *error){
    
        NSLog(@"Error al guardar %s\n\n%@",__func__,error);
    
    }];

}

-(void) autoSave{
    
    
    if(AUTO_SAVE){
        
        NSLog(@"Autoguardando");
        [self save];
        [self performSelector:@selector(autoSave)
                   withObject:nil
                   afterDelay:2];
    
    }
}



@end
