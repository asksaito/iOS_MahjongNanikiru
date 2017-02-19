//
//  QuestionGAEServer.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/04/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionGAEServer.h"
//#import "QuestionJSONParser.h"


@implementation QuestionGAEServer
@synthesize url;
@synthesize parser;

// シングルトンインスタンス
static QuestionGAEServer* sharedQuestionGAEServer = nil;

- (id) init {
	self = [super init];
	if ( self ) {
		// サーバーURL
		self.url = @"http://localhost:8080/";
		// パーサー
		self.parser = [[QuestionJSONParser alloc] init];
	}
	
    return self;
}

// 同期通信でGETリクエスト
- (NSString*)sendSyncGetRequest:(NSString*)apiName parameter:(NSString*)parameter {
	NSURL* apiUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@", self.url, apiName, parameter]];
	NSURLRequest* request = [NSURLRequest requestWithURL:apiUrl];
	NSURLResponse* response;
    NSError* error;
	
	NSData* resp_data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
	NSString* contents = [[NSString alloc] initWithData:resp_data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", contents);
	
	return contents;
}

// 非同期通信
- (void)sendGetRequest:(NSString*)apiName parameter:(NSString*)parameter {
    //NSString *urlstr = @"ttp://www.yahoo.com/";
    //NSURL *url = [NSURL URLWithString:urlstr];
	NSURL* apiUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@", self.url, apiName, parameter]];
	NSString* debug = [NSString stringWithFormat:@"%@%@?%@", self.url, apiName, parameter];
	NSLog(@"%@", debug);
	
    NSURLRequest *request = [NSURLRequest requestWithURL:apiUrl];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    if (!conn) {
        // error handling
		NSLog(@"sendGetRequest error");
		return;
    }
	
	buffer = [[NSMutableData data] retain];
}

- (void)sendPostRequest {
    //NSString *urlstr = @"ttp://my-test-site/postTest";
    NSURL *apiUrl = [NSURL URLWithString:self.url];
    NSData *myRequestData = [@"name=Taka&color=black" dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: apiUrl]; 
    [request setHTTPMethod: @"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody: myRequestData];
	
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
	
    if (conn) {
        buffer = [[NSMutableData data] retain];
    } else {
        // error handling
    }
}

- (void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)res {
    NSHTTPURLResponse *hres = (NSHTTPURLResponse *)res;
    NSLog(@"Received Response. Status Code: %d", [hres statusCode]);
    NSLog(@"Expected ContentLength: %qi", [hres expectedContentLength]);
    NSLog(@"MIMEType: %@", [hres MIMEType]);
    NSLog(@"Suggested File Name: %@", [hres suggestedFilename]);
    NSLog(@"Text Encoding Name: %@", [hres textEncodingName]);
    NSLog(@"URL: %@", [hres URL]);
    NSLog(@"Received Response. Status Code: %d", [hres statusCode]);
    NSDictionary *dict = [hres allHeaderFields];
    NSArray *keys = [dict allKeys];
    for (int i = 0; i < [keys count]; i++) {
        NSLog(@"    %@: %@",
              [keys objectAtIndex:i],
              [dict objectForKey:[keys objectAtIndex:i]]);
    }
    [buffer setLength:0];
}


- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)receivedData {
    [buffer appendData:receivedData];
}


- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error {
    [conn release];
    [buffer release];
    //NSLog(@"Connection failed: %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
}


- (void)connectionDidFinishLoading:(NSURLConnection *)conn {
    NSLog(@"Succeed!! Received %d bytes of data", [buffer length]);
    NSString *contents = [[NSString alloc] initWithData:buffer encoding:NSUTF8StringEncoding];
    NSLog(@"%@", contents);
    [buffer release];
}


// 以下サーバーアクセスAPI

//http://localhost:8080/PutQuestion?no=1&author=iPhoneAuthor&situation=1&tehai=11%2C12%2C13%2C14%2C15&tsumo=21&dora=31

- (NSArray*) getNewList {
	//NSMutableArray* newQuestionList = [NSMutableArray array];
	
	// GetNewList API
	int limit = 10;
	int offset = 0;
	NSString* respJson = [self sendSyncGetRequest:@"GetNewList" parameter:[NSString stringWithFormat:@"limit=%d&offset=%d", limit, offset]];
	
	// JSONレスポンスの解析
	NSArray* newQuestionList = [self.parser parseQuestionList:respJson];

	[respJson release];
	
	return newQuestionList;
}

- (Question*) getQuestion:(int)no {
	// GetQuestion API
	NSString* respJson = [self sendSyncGetRequest:@"GetQuestion" parameter:[NSString stringWithFormat:@"no=%d", no]];
	
	// JSONレスポンスの解析
	Question* question = [self.parser parseQuestion:respJson];
	
	[respJson release];
	
	return question;
}




+ (QuestionGAEServer*)sharedInstance {
	// double checked locking Pattern
	if (sharedQuestionGAEServer == nil) {
		@synchronized(self) {
			if (sharedQuestionGAEServer == nil) {
				sharedQuestionGAEServer = [[self alloc] init];
			}
		}
	}
	
	return sharedQuestionGAEServer;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedQuestionGAEServer == nil) {
			sharedQuestionGAEServer = [super allocWithZone:zone];
			return sharedQuestionGAEServer;
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
