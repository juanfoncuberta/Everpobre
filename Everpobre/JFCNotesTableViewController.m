//
//  JFCNotesTableViewController.m
//  Everpobre
//
//  Created by Juan Foncuberta on 23/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "JFCNotesTableViewController.h"
#import "JFCNote.h"
#import "JFCNotebook.h"

@interface JFCNotesTableViewController ()
@property (strong,nonatomic) JFCNotebook *model;
@end

@implementation JFCNotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - notebook

-(id) initWithNotebook:(JFCNotebook *)notebook{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JFCNote entityName]];
    req.predicate = [NSPredicate predicateWithFormat:@"notebook == %@",notebook];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JFCNamedEntityAttributes.name
                                                        ascending:YES]];
    
    NSFetchedResultsController *fetched = [[NSFetchedResultsController alloc]initWithFetchRequest:req
                                                                             managedObjectContext:notebook.managedObjectContext
                                                                               sectionNameKeyPath:nil
                                                                                        cacheName:nil];
    
    if(self = [super initWithFetchedResultsController:fetched style:UITableViewStylePlain]){
        
        self.fetchedResultsController = fetched;
        self.model = notebook;
        self.title = notebook.name;
        
    }
    
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
