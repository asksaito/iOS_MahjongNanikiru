//
//  UIPaiImageView.h
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIPaiImageView : UIImageView {
	int paiId;
	BOOL selected;
	CGPoint defaultPoint;
}
@property (nonatomic) int paiId;
@property (nonatomic) BOOL selected;
@property (nonatomic) CGPoint defaultPoint;

- (void)reset;

@end
