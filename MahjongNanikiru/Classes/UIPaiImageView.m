//
//  UIPaiImageView.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIPaiImageView.h"
#import "PAI.h"

@implementation UIPaiImageView
@synthesize paiId;
@synthesize selected;
@synthesize defaultPoint;

/*
- (id) init {
    self = [super init];
	if (self) {
		self.selected = FALSE;
		self.defaultPoint = self.center;
	}
	return self;
}
*/

- (void)awakeFromNib {
	//ここに初期化コード
	self.paiId = PAI_UNDEFINED;
	self.selected = FALSE;
	self.defaultPoint = self.center;
}

/**
 * タッチイベント開始
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
	if(!self.selected) {
		// 麻雀牌タップ時のアニメーション
		CGPoint point = self.center;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.1];
		[UIView setAnimationDelay:0];
		if (self.selected) {
			self.selected = FALSE;
			point.y += 18;
		}
		else {
			self.selected = TRUE;
			point.y -= 18;
		}
		self.center = point;
		[UIView commitAnimations];
	}
}

- (void)reset {
	// 麻雀牌の位置を元に戻す
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.1];
	[UIView setAnimationDelay:0];
	self.selected = FALSE;
	self.center = self.defaultPoint;
	[UIView commitAnimations];
}

@end
