//
//  Question.h
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/04/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Question : NSObject {
	int no;
	NSString* author;
	NSString* title;
	NSString* detail;
	int bakyo;
	int honba;
	int cha;
	int junme;
	int tenbo;
	NSArray* tehai;
	int tsumo;
	NSArray* dora;
	NSDate* date;
}
@property (nonatomic) int no;
@property (nonatomic, retain) NSString* author;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* detail;
@property (nonatomic) int bakyo;
@property (nonatomic) int honba;
@property (nonatomic) int cha;
@property (nonatomic) int junme;
@property (nonatomic) int tenbo;
@property (nonatomic, retain) NSArray* tehai;
@property (nonatomic) int tsumo;
@property (nonatomic, retain) NSArray* dora;
@property (nonatomic, retain) NSDate* date;

@end
