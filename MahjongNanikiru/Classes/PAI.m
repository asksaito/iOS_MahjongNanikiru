//
//  PAI.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/04/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PAI.h"


@implementation PAI
@synthesize id;
@synthesize pai_image;

- (id)init
{
	self = [super init];
	if ( self ) {
		self = [self initWithIdAndFilePath:PAI_UNDEFINED filePath:nil];
	}
	return self;
}

- (id)initWithIdAndFilePath:(int)paiId filePath:(NSString*)path
{
	self = [super init];
	if ( self ) {
		// ここに初期化コードを書く
		self.id = paiId;
		self.pai_image = [UIImage imageNamed:path];
	}
	return self;
}

- (void)dealloc
{
	// ここに終了コードを書く
	[super dealloc];
}


@end
