//
//  MahjongConst.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/04/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MahjongConst.h"

@implementation MahjongConst
@synthesize MANZU_1;
@synthesize MANZU_2;
@synthesize MANZU_3;
@synthesize MANZU_4;
@synthesize MANZU_5;
@synthesize MANZU_6;
@synthesize MANZU_7;
@synthesize MANZU_8;
@synthesize MANZU_9;
@synthesize PINZU_1;
@synthesize PINZU_2;
@synthesize PINZU_3;
@synthesize PINZU_4;
@synthesize PINZU_5;
@synthesize PINZU_6;
@synthesize PINZU_7;
@synthesize PINZU_8;
@synthesize PINZU_9;
@synthesize SOUZU_1;
@synthesize SOUZU_2;
@synthesize SOUZU_3;
@synthesize SOUZU_4;
@synthesize SOUZU_5;
@synthesize SOUZU_6;
@synthesize SOUZU_7;
@synthesize SOUZU_8;
@synthesize SOUZU_9;
@synthesize TON;
@synthesize NANN;
@synthesize SHA;
@synthesize PE;
@synthesize HAKU;
@synthesize HATSU;
@synthesize CHUN;
@synthesize MANZU_AKA_5;
@synthesize PINZU_AKA_5;
@synthesize SOUZU_AKA_5;

@synthesize paiMap;

// シングルトンインスタンス
static MahjongConst* sharedMahjongConst = nil;

- (id)init
{
	self = [super init];
	if ( self ) {
		// 麻雀牌のインスタンス生成
		self.MANZU_1 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_1 filePath:@"p_ms1_1.png"];
		self.MANZU_2 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_2 filePath:@"p_ms2_1.png"];
		self.MANZU_3 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_3 filePath:@"p_ms3_1.png"];
		self.MANZU_4 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_4 filePath:@"p_ms4_1.png"];
		self.MANZU_5 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_5 filePath:@"p_ms5_1.png"];
		self.MANZU_6 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_6 filePath:@"p_ms6_1.png"];
		self.MANZU_7 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_7 filePath:@"p_ms7_1.png"];
		self.MANZU_8 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_8 filePath:@"p_ms8_1.png"];
		self.MANZU_9 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_9 filePath:@"p_ms9_1.png"];
		self.PINZU_1 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_1 filePath:@"p_ps1_1.png"];
		self.PINZU_2 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_2 filePath:@"p_ps2_1.png"];
		self.PINZU_3 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_3 filePath:@"p_ps3_1.png"];
		self.PINZU_4 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_4 filePath:@"p_ps4_1.png"];
		self.PINZU_5 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_5 filePath:@"p_ps5_1.png"];
		self.PINZU_6 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_6 filePath:@"p_ps6_1.png"];
		self.PINZU_7 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_7 filePath:@"p_ps7_1.png"];
		self.PINZU_8 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_8 filePath:@"p_ps8_1.png"];
		self.PINZU_9 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_9 filePath:@"p_ps9_1.png"];
		self.SOUZU_1 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_1 filePath:@"p_ss1_1.png"];
		self.SOUZU_2 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_2 filePath:@"p_ss2_1.png"];
		self.SOUZU_3 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_3 filePath:@"p_ss3_1.png"];
		self.SOUZU_4 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_4 filePath:@"p_ss4_1.png"];
		self.SOUZU_5 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_5 filePath:@"p_ss5_1.png"];
		self.SOUZU_6 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_6 filePath:@"p_ss6_1.png"];
		self.SOUZU_7 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_7 filePath:@"p_ss7_1.png"];
		self.SOUZU_8 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_8 filePath:@"p_ss8_1.png"];
		self.SOUZU_9 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_9 filePath:@"p_ss9_1.png"];
		self.TON     = [[PAI alloc] initWithIdAndFilePath:PAI_TON     filePath:@"p_ji_ton_1.png"];
		self.NANN    = [[PAI alloc] initWithIdAndFilePath:PAI_NANN    filePath:@"p_ji_nan_1.png"];
		self.SHA     = [[PAI alloc] initWithIdAndFilePath:PAI_SHA     filePath:@"p_ji_sha_1.png"];
		self.PE      = [[PAI alloc] initWithIdAndFilePath:PAI_PE      filePath:@"p_ji_pe_1.png"];
		self.HAKU    = [[PAI alloc] initWithIdAndFilePath:PAI_HAKU    filePath:@"p_ji_haku_1.png"];
		self.HATSU   = [[PAI alloc] initWithIdAndFilePath:PAI_HATSU   filePath:@"p_ji_hatsu_1.png"];
		self.CHUN    = [[PAI alloc] initWithIdAndFilePath:PAI_CHUN    filePath:@"p_ji_chun_1.png"];
		self.MANZU_AKA_5 = [[PAI alloc] initWithIdAndFilePath:PAI_MANZU_AKA_5 filePath:@"p_ms5_aka_1.png"];
		self.PINZU_AKA_5 = [[PAI alloc] initWithIdAndFilePath:PAI_PINZU_AKA_5 filePath:@"p_ps5_aka_1.png"];
		self.SOUZU_AKA_5 = [[PAI alloc] initWithIdAndFilePath:PAI_SOUZU_AKA_5 filePath:@"p_ss5_aka_1.png"];
		
		self.paiMap = [NSMutableDictionary dictionary];
		[self.paiMap setObject:self.MANZU_1 forKey:[NSNumber numberWithInt:self.MANZU_1.id]];
		[self.paiMap setObject:self.MANZU_2 forKey:[NSNumber numberWithInt:self.MANZU_2.id]];
		[self.paiMap setObject:self.MANZU_3 forKey:[NSNumber numberWithInt:self.MANZU_3.id]];
		[self.paiMap setObject:self.MANZU_4 forKey:[NSNumber numberWithInt:self.MANZU_4.id]];
		[self.paiMap setObject:self.MANZU_5 forKey:[NSNumber numberWithInt:self.MANZU_5.id]];
		[self.paiMap setObject:self.MANZU_6 forKey:[NSNumber numberWithInt:self.MANZU_6.id]];
		[self.paiMap setObject:self.MANZU_7 forKey:[NSNumber numberWithInt:self.MANZU_7.id]];
		[self.paiMap setObject:self.MANZU_8 forKey:[NSNumber numberWithInt:self.MANZU_8.id]];
		[self.paiMap setObject:self.MANZU_9 forKey:[NSNumber numberWithInt:self.MANZU_9.id]];
		[self.paiMap setObject:self.PINZU_1 forKey:[NSNumber numberWithInt:self.PINZU_1.id]];
		[self.paiMap setObject:self.PINZU_2 forKey:[NSNumber numberWithInt:self.PINZU_2.id]];
		[self.paiMap setObject:self.PINZU_3 forKey:[NSNumber numberWithInt:self.PINZU_3.id]];
		[self.paiMap setObject:self.PINZU_4 forKey:[NSNumber numberWithInt:self.PINZU_4.id]];
		[self.paiMap setObject:self.PINZU_5 forKey:[NSNumber numberWithInt:self.PINZU_5.id]];
		[self.paiMap setObject:self.PINZU_6 forKey:[NSNumber numberWithInt:self.PINZU_6.id]];
		[self.paiMap setObject:self.PINZU_7 forKey:[NSNumber numberWithInt:self.PINZU_7.id]];
		[self.paiMap setObject:self.PINZU_8 forKey:[NSNumber numberWithInt:self.PINZU_8.id]];
		[self.paiMap setObject:self.PINZU_9 forKey:[NSNumber numberWithInt:self.PINZU_9.id]];
		[self.paiMap setObject:self.SOUZU_1 forKey:[NSNumber numberWithInt:self.SOUZU_1.id]];
		[self.paiMap setObject:self.SOUZU_2 forKey:[NSNumber numberWithInt:self.SOUZU_2.id]];
		[self.paiMap setObject:self.SOUZU_3 forKey:[NSNumber numberWithInt:self.SOUZU_3.id]];
		[self.paiMap setObject:self.SOUZU_4 forKey:[NSNumber numberWithInt:self.SOUZU_4.id]];
		[self.paiMap setObject:self.SOUZU_5 forKey:[NSNumber numberWithInt:self.SOUZU_5.id]];
		[self.paiMap setObject:self.SOUZU_6 forKey:[NSNumber numberWithInt:self.SOUZU_6.id]];
		[self.paiMap setObject:self.SOUZU_7 forKey:[NSNumber numberWithInt:self.SOUZU_7.id]];
		[self.paiMap setObject:self.SOUZU_8 forKey:[NSNumber numberWithInt:self.SOUZU_8.id]];
		[self.paiMap setObject:self.SOUZU_9 forKey:[NSNumber numberWithInt:self.SOUZU_9.id]];
		[self.paiMap setObject:self.TON     forKey:[NSNumber numberWithInt:self.TON.id]];
		[self.paiMap setObject:self.NANN    forKey:[NSNumber numberWithInt:self.NANN.id]];
		[self.paiMap setObject:self.SHA     forKey:[NSNumber numberWithInt:self.SHA.id]];
		[self.paiMap setObject:self.PE      forKey:[NSNumber numberWithInt:self.PE.id]];
		[self.paiMap setObject:self.HAKU    forKey:[NSNumber numberWithInt:self.HAKU.id]];
		[self.paiMap setObject:self.HATSU   forKey:[NSNumber numberWithInt:self.HATSU.id]];
		[self.paiMap setObject:self.CHUN    forKey:[NSNumber numberWithInt:self.CHUN.id]];
		[self.paiMap setObject:self.MANZU_AKA_5 forKey:[NSNumber numberWithInt:self.MANZU_AKA_5.id]];
		[self.paiMap setObject:self.PINZU_AKA_5 forKey:[NSNumber numberWithInt:self.PINZU_AKA_5.id]];
		[self.paiMap setObject:self.SOUZU_AKA_5 forKey:[NSNumber numberWithInt:self.SOUZU_AKA_5.id]];
	}
	return self;
}

- (PAI*)lookupPaiForKey:(int)key {
	return [self.paiMap objectForKey:[NSNumber numberWithInt:key]];
}


+ (MahjongConst*)sharedInstance {
	// double checked locking Pattern
	if (sharedMahjongConst == nil) {
		@synchronized(self) {
			if (sharedMahjongConst == nil) {
				sharedMahjongConst = [[self alloc] init];
			}
		}
	}
	
	return sharedMahjongConst;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedMahjongConst == nil) {
			sharedMahjongConst = [super allocWithZone:zone];
			return sharedMahjongConst;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone*)zone {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

- (id)retain {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

- (unsigned)retainCount {
	return UINT_MAX;  // 解放できないインスタンスを表すため unsigned int 値の最大値 UINT_MAX を返す
}

- (void)release {
	// シングルトン状態を保持するため何もしない
}

- (id)autorelease {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}


@end
