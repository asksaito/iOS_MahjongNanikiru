//
//  Utils.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"


@implementation Utils

+ (NSString*) dateToString:(NSDate*) date {
	// NSDateFormatter を用意します。
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	
	// 変換用の書式を設定します。
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	
	// NSDate を NSString に変換します。
	NSString* date_converted = [formatter stringFromDate:date];
	
	// 使い終わった NSDateFormatter を解放します。
	[formatter release];
	
	return date_converted;
}

@end
