//
//  PAI.h
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/04/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PAI_MANZU_1 11
#define PAI_MANZU_2 12
#define PAI_MANZU_3 13
#define PAI_MANZU_4 14
#define PAI_MANZU_5 15
#define PAI_MANZU_6 16
#define PAI_MANZU_7 17
#define PAI_MANZU_8 18
#define PAI_MANZU_9 19
#define PAI_PINZU_1 21
#define PAI_PINZU_2 22
#define PAI_PINZU_3 23
#define PAI_PINZU_4 24
#define PAI_PINZU_5 25
#define PAI_PINZU_6 26
#define PAI_PINZU_7 27
#define PAI_PINZU_8 28
#define PAI_PINZU_9 29
#define PAI_SOUZU_1 31
#define PAI_SOUZU_2 32
#define PAI_SOUZU_3 33
#define PAI_SOUZU_4 34
#define PAI_SOUZU_5 35
#define PAI_SOUZU_6 36
#define PAI_SOUZU_7 37
#define PAI_SOUZU_8 38
#define PAI_SOUZU_9 39
#define PAI_TON 41
#define PAI_NANN 42
#define PAI_SHA 43
#define PAI_PE 44
#define PAI_HAKU 45
#define PAI_HATSU 46
#define PAI_CHUN 47
#define PAI_MANZU_AKA_5 65
#define PAI_PINZU_AKA_5 75
#define PAI_SOUZU_AKA_5 85
#define PAI_UNDEFINED 0

@interface PAI : NSObject {
	// 麻雀牌ID
	int id;
	// 麻雀牌画像
	UIImage* pai_image;
}
@property (nonatomic) int id;
@property (nonatomic, retain) UIImage* pai_image;

// イニシャライザの宣言
- (id)init;                     // 引数なし
- (id)initWithIdAndFilePath:(int)paiId filePath:(NSString*)path; // 引数あり

@end
