// Inkwell
// BaseTableViewCell.m
//
//
//  Created by Code_浅蓝 on 2019/5/21.
//  Copyright © 2019年 Inkwell. All rights reserved.
//
// @ description <#描述#>


#import "BaseTableViewCell.h"

@implementation BaseTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = white_color;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpViews];
        [self bindModel];
        
    }
    return self;
}
- (void)bindModel{}

- (void)setUpViews{
    
}

@end
