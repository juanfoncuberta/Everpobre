//
//  JFCNotesTableViewController.h
//  Everpobre
//
//  Created by Juan Foncuberta on 23/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "JFCCoreDataTableViewController.h"

@class JFCNotebook;
@interface JFCNotesTableViewController : JFCCoreDataTableViewController

-(id) initWithNotebook:(JFCNotebook *)notebook;

@end
