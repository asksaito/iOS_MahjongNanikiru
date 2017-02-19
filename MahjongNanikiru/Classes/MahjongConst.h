//
//  MahjongConst.h
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/04/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAI.h"


// 場況
#define KYOKU_TON_1		1
#define KYOKU_TON_2		2
#define KYOKU_TON_3		3
#define KYOKU_TON_4		4
#define KYOKU_NANN_1	5
#define KYOKU_NANN_2	6
#define KYOKU_NANN_3	7
#define KYOKU_NANN_4	8
#define KYOKU_SHA_1		9
#define KYOKU_SHA_2		10
#define KYOKU_SHA_3		11
#define KYOKU_SHA_4		12
#define KYOKU_PE_1		13
#define KYOKU_PE_2		14
#define KYOKU_PE_3		15
#define KYOKU_PE_4		16
#define KYOKU_ALL_LAST	17

@interface MahjongConst : NSObject {
	PAI* MANZU_1;
	PAI* MANZU_2;
	PAI* MANZU_3;
	PAI* MANZU_4;
	PAI* MANZU_5;
	PAI* MANZU_6;
	PAI* MANZU_7;
	PAI* MANZU_8;
	PAI* MANZU_9;
	PAI* PINZU_1;
	PAI* PINZU_2;
	PAI* PINZU_3;
	PAI* PINZU_4;
	PAI* PINZU_5;
	PAI* PINZU_6;
	PAI* PINZU_7;
	PAI* PINZU_8;
	PAI* PINZU_9;
	PAI* SOUZU_1;
	PAI* SOUZU_2;
	PAI* SOUZU_3;
	PAI* SOUZU_4;
	PAI* SOUZU_5;
	PAI* SOUZU_6;
	PAI* SOUZU_7;
	PAI* SOUZU_8;
	PAI* SOUZU_9;
	PAI* TON;
	PAI* NANN;
	PAI* SHA;
	PAI* PE;
	PAI* HAKU;
	PAI* HATSU;
	PAI* CHUN;
	PAI* MANZU_AKA_5;
	PAI* PINZU_AKA_5;
	PAI* SOUZU_AKA_5;
	
	NSMutableDictionary* paiMap;
}
@property (nonatomic, retain) PAI* MANZU_1;
@property (nonatomic, retain) PAI* MANZU_2;
@property (nonatomic, retain) PAI* MANZU_3;
@property (nonatomic, retain) PAI* MANZU_4;
@property (nonatomic, retain) PAI* MANZU_5;
@property (nonatomic, retain) PAI* MANZU_6;
@property (nonatomic, retain) PAI* MANZU_7;
@property (nonatomic, retain) PAI* MANZU_8;
@property (nonatomic, retain) PAI* MANZU_9;
@property (nonatomic, retain) PAI* PINZU_1;
@property (nonatomic, retain) PAI* PINZU_2;
@property (nonatomic, retain) PAI* PINZU_3;
@property (nonatomic, retain) PAI* PINZU_4;
@property (nonatomic, retain) PAI* PINZU_5;
@property (nonatomic, retain) PAI* PINZU_6;
@property (nonatomic, retain) PAI* PINZU_7;
@property (nonatomic, retain) PAI* PINZU_8;
@property (nonatomic, retain) PAI* PINZU_9;
@property (nonatomic, retain) PAI* SOUZU_1;
@property (nonatomic, retain) PAI* SOUZU_2;
@property (nonatomic, retain) PAI* SOUZU_3;
@property (nonatomic, retain) PAI* SOUZU_4;
@property (nonatomic, retain) PAI* SOUZU_5;
@property (nonatomic, retain) PAI* SOUZU_6;
@property (nonatomic, retain) PAI* SOUZU_7;
@property (nonatomic, retain) PAI* SOUZU_8;
@property (nonatomic, retain) PAI* SOUZU_9;
@property (nonatomic, retain) PAI* TON;
@property (nonatomic, retain) PAI* NANN;
@property (nonatomic, retain) PAI* SHA;
@property (nonatomic, retain) PAI* PE;
@property (nonatomic, retain) PAI* HAKU;
@property (nonatomic, retain) PAI* HATSU;
@property (nonatomic, retain) PAI* CHUN;
@property (nonatomic, retain) PAI* MANZU_AKA_5;
@property (nonatomic, retain) PAI* PINZU_AKA_5;
@property (nonatomic, retain) PAI* SOUZU_AKA_5;

@property (nonatomic, retain) NSMutableDictionary* paiMap;

// PAIインスタンスをマップから取得
- (PAI*)lookupPaiForKey:(int)key;

// シングルトンインスタンス取得
+ (MahjongConst*)sharedInstance;

@end
