//
//  QuestionJSONParser.h
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionParser.h"

#define JSON_RESULT		@"Result"
#define JSON_DATA		@"Data"

@interface QuestionJSONParser : QuestionParser {

}
- (id) init;

// 問題リストのパース
- (NSArray*) parseQuestionList:(NSString*)str;
// 問題のパース
- (Question*) parseQuestion:(NSString*)str;

@end
