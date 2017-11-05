//
//  JFCNotebookCellView.h
//  Everpobre
//
//  Created by Juan Foncuberta on 21/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFCNotebookCellView : UITableViewCell


@property (nonatomic,strong) IBOutlet UILabel *nameView;
@property (nonatomic,strong) IBOutlet UILabel *numberOfNotesView;


+(NSString *)cellId;
+(CGFloat)cellHeight;
@end


