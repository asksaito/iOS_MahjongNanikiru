//
//  QuestionGAEServer.h
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/04/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionServer.h"
#import "QuestionJSONParser.h"

@interface QuestionGAEServer : QuestionServer {
	NSString* url;
	QuestionJSONParser* parser;
	NSMutableData* buffer;
}
@property (nonatomic, retain) NSString* url;
@property (nonatomic, retain) QuestionJSONParser* parser;

- (id) init;

- (void)sendGetRequest:(NSString*)apiName parameter:(NSString*)parameter;

//- (void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)res;

// 新着リスト取得
- (NSArray*) getNewList;
// 問題取得
- (Question*) getQuestion:(int)no;


// シングルトンインスタンス取得
+ (QuestionGAEServer*)sharedInstance;

@end
