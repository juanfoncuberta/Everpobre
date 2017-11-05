//
//  JFCNotebooksViewController.m
//  Everpobre
//
//  Created by Juan Foncuberta on 20/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "JFCNotebooksViewController.h"
#import "JFCNotebook.h"
#import "JFCNotebookCellView.h"
@interface JFCNotebooksViewController ()

@end

@implementation JFCNotebooksViewController

#pragma mark -viewlife

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.title = @"Everpobre";
    
    
    //crear boton con un targer y un action
    UIBarButtonItem *addBt = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNoteBook:)];
    
    //añadimos al navbar
    self.navigationItem.rightBarButtonItem = addBt;
    
    //boton de edicion
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    //Dar alta en notificacion en sensor de proximidad
    
    UIDevice *dev = [UIDevice currentDevice];
    
    if([self hasProximitySensor]){
        [dev setProximityMonitoringEnabled:YES];
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(proximityStateDidChange:)
                       name:UIDeviceProximityStateDidChangeNotification
                     object:nil];
    }
    
    //registramos el nib
    
    UINib *cellNib = [UINib nibWithNibName:@"JFCNotebookCellView" bundle:nil];
    
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[JFCNotebookCellView cellId]];
}

-(void) viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center removeObserver:self];
    
}
#pragma mark -actions

-(void)addNoteBook:(id)sender{

    //crear instancia de notebook
    [JFCNotebook notebookWithName:@"New notebook"
                                            context:self.fetchedResultsController.managedObjectContext];
    //La tabla se refresca sola con fecthresultcontroller
}
#pragma mark -data source

-(void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{


    if(editingStyle == UITableViewCellEditingStyleDelete){
    
        //averiguar que libreta es
        JFCNotebook *del = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        
        //quitarla del modelo
        [self.fetchedResultsController.managedObjectContext deleteObject:del];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //averiguar notebook
    JFCNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //crear celda
    
   
    JFCNotebookCellView *cell = [tableView dequeueReusableCellWithIdentifier:[JFCNotebookCellView cellId]];
    
   
    //sincronizar libreta->celda
    
    
    cell.nameView.text = nb.name;
    cell.numberOfNotesView.text = [NSString stringWithFormat:@"%lu", nb.notes.count];
    
    //devolver celda
    
    return cell;
}


#pragma mark -Tableview Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    return [JFCNotebookCellView cellHeight];
}


#pragma  mark -proximitySensor

-(BOOL)hasProximitySensor{

    UIDevice *dev = [UIDevice currentDevice];
    BOOL oldValue = [dev isProximityMonitoringEnabled];
    [dev setProximityMonitoringEnabled:oldValue];
    BOOL newValue = [dev isProximityMonitoringEnabled];
    [dev setProximityMonitoringEnabled:newValue];
    
    return (oldValue != newValue);
    
    
    

}
//UIDeviceProximityStateDidChangeNotification
-(void) proximityStateDidChange:(NSNotification *)notification{
    
    [self.fetchedResultsController.managedObjectContext.undoManager undo];
    

}








@end
