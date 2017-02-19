//
//  SimpleCellViewController.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/04/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SimpleCellViewController.h"


@implementation SimpleCellViewController
@synthesize labelNo;
@synthesize labelBakyo;
@synthesize labelTitle;
@synthesize imgPai1;
@synthesize imgPai2;
@synthesize imgPai3;
@synthesize imgPai4;
@synthesize imgPai5;
@synthesize imgPai6;
@synthesize imgPai7;
@synthesize imgPai8;
@synthesize imgPai9;
@synthesize imgPai10;
@synthesize imgPai11;
@synthesize imgPai12;
@synthesize imgPai13;
@synthesize imgPaiTsumo;
@synthesize labelAuthor;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
