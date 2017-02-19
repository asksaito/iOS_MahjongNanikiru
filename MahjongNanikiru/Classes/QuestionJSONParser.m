//
//  QuestionJSONParser.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionJSONParser.h"
#import "JSON.h"

@implementation QuestionJSONParser

- (id) init {
    return [super init];
}

- (NSDictionary*) parseJSONString:(NSString*)str {
	// JSONのパース
	id json = [str JSONValue];
	if ([json isKindOfClass:[NSDictionary class]]) {
		NSDictionary* dictJson = (NSDictionary*)json;
		NSLog(@"%@", dictJson);
		//NSLog(@"%@", [[[[dictJson objectForKey:@"Data"] objectForKey:@"QuestionList"] objectAtIndex:0] objectForKey:@"Detail"]);
		
		return dictJson;
	}
	
	return nil;
}

- (Question*) convertQuestion:(NSDictionary*)dict {
	Question* question = [[Question alloc] init];
	question.no = [[dict objectForKey:@"No"] intValue];
	question.author = [dict objectForKey:@"Author"];
	question.title = [dict objectForKey:@"Title"];
	question.detail = [dict objectForKey:@"Detail"];
	question.bakyo = [[dict objectForKey:@"Bakyo"] intValue];
	question.honba = [[dict objectForKey:@"Honba"] intValue];
	question.cha = [[dict objectForKey:@"Cha"] intValue];
	question.junme = [[dict objectForKey:@"Junme"] intValue];
	question.tenbo = [[dict objectForKey:@"Tenbo"] intValue];
	question.tehai = [dict objectForKey:@"Tehai"];
	question.tsumo = [[dict objectForKey:@"Tsumo"] intValue];
	question.dora = [dict objectForKey:@"Dora"];
	
	// NSDate型に変換
	NSDateFormatter* df = [[NSDateFormatter alloc] init];
	//// 現在のロケールを設定 
	//[df setLocale:[NSLocale currentLocale]];
	//[df setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"] autorelease]];
	[df setTimeStyle:NSDateFormatterMediumStyle];
	[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	question.date = [df dateFromString:[[dict objectForKey:@"Date"] substringToIndex:19]]; // ミリ秒を切り捨てる
	//NSLog(@"MediumStyle : %@", [df stringFromDate:question.date]);
	
	return question;
}

- (NSArray*) parseQuestionList:(NSString*)str {
	NSMutableArray* questionList = [NSMutableArray array];
	
	// JSONのパース
	NSDictionary* dictJson = [self parseJSONString:str];
	if (dictJson != nil) {
		// Resultを検証
		if(![dictJson objectForKey:JSON_RESULT]) {
			return questionList;
		}
		
		// 問題リストを取り出す
		NSArray* questionArray = [[dictJson objectForKey:JSON_DATA] objectForKey:@"QuestionList"];
		int cnt = [questionArray count];
		for (int i=0; i<cnt; i++) {
			NSDictionary* q = (NSDictionary*)[questionArray objectAtIndex:i];
			NSLog(@"%@", q);
			
			// Questionオブジェクトに変換
			Question* question = [self convertQuestion:q];
			
			/*
			Question* question = [[Question alloc] init];
			question.no = [[q objectForKey:@"No"] intValue];
			question.author = [q objectForKey:@"Author"];
			question.title = [q objectForKey:@"Title"];
			question.detail = [q objectForKey:@"Detail"];
			question.bakyo = [[q objectForKey:@"Bakyo"] intValue];
			question.honba = [[q objectForKey:@"Honba"] intValue];
			question.cha = [[q objectForKey:@"Cha"] intValue];
			question.tehai = [q objectForKey:@"Tehai"];
			question.tsumo = [[q objectForKey:@"Tsumo"] intValue];
			question.dora = [[q objectForKey:@"Dora"] intValue];
			
			// NSDate型に変換
			NSDateFormatter* df = [[NSDateFormatter alloc] init];
			//// 現在のロケールを設定 
			//[df setLocale:[NSLocale currentLocale]];
			//[df setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"] autorelease]];
			[df setTimeStyle:NSDateFormatterMediumStyle];
			[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
			question.date = [df dateFromString:[[q objectForKey:@"Date"] substringToIndex:19]]; // ミリ秒を切り捨てる
			//NSLog(@"MediumStyle : %@", [df stringFromDate:question.date]);
			*/
			
			[questionList addObject:question];
		}
	}
	
	// QuestionArrayオブジェクトの作成
	
//	NSArray* list = [[NSArray alloc] initWithArray:newQuestionList];
//	[newQuestionList release];
//	return list;
	
	return [[NSArray alloc] initWithArray:questionList];
}

- (Question*) parseQuestion:(NSString*)str {
	Question* question = [[Question alloc] init];
	
	// JSONのパース
	NSDictionary* dictJson = [self parseJSONString:str];
	if (dictJson != nil) {
		// Resultを検証
		if(![dictJson objectForKey:JSON_RESULT]) {
			return question;
		}
		
		// 問題を取り出す
		NSDictionary* q = [dictJson objectForKey:JSON_DATA];
		NSLog(@"%@", q);
		
		// Questionオブジェクトに変換
		question = [self convertQuestion:q];
	}
	
	return question;
}

@end
