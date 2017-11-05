//
//  JFCNotebookCellView.m
//  Everpobre
//
//  Created by Juan Foncuberta on 21/10/17.
//  Copyright © 2017 Juan Foncuberta. All rights reserved.
//

#import "JFCNotebookCellView.h"

@implementation JFCNotebookCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark -Class methods

+(NSString *)cellId{

    return NSStringFromClass(self);
}
+(CGFloat)cellHeight{

    return 60.0f;
}

@end
