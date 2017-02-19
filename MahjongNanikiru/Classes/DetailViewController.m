//
//  DetailViewController.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

#import "Utils.h"
#import "MahjongConst.h"
#import "QuestionGAEServer.h"

@implementation DetailViewController
@synthesize labelNo;
@synthesize labelBakyo;
@synthesize labelDetail;
@synthesize imgPai1;
@synthesize imgPai2;
@synthesize imgPai3;
@synthesize imgPai4;
@synthesize imgPai5;
@synthesize imgPai6;
@synthesize imgPai7;
@synthesize imgPai8;
@synthesize imgPai9;
@synthesize imgPai10;
@synthesize imgPai11;
@synthesize imgPai12;
@synthesize imgPai13;
@synthesize imgPaiTsumo;
@synthesize imgPaiDora1;
@synthesize imgPaiDora2;
@synthesize imgPaiDora3;
@synthesize imgPaiDora4;
@synthesize labelAuthor;

@synthesize no;
//@synthesize question;
@synthesize selectedPaiImageView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	QuestionGAEServer* server = [QuestionGAEServer sharedInstance];
	Question* q = [server getQuestion:self.no];
	
	self.labelNo.text = [NSString stringWithFormat:@"No.%04d", self.no];
	self.labelBakyo.text = [NSString stringWithFormat:@"東%d局 %d本場 %d巡目 %d点 %d家", q.bakyo, q.honba, q.junme, q.tenbo, q.cha];
	self.labelDetail.text = [q.detail stringByReplacingOccurrencesOfString:@"¥n" withString:@"\n"];	// 改行文字を改行コードに変換して表示
	MahjongConst* CONST = [MahjongConst sharedInstance];
	PAI* pai;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:0] intValue]];
	self.imgPai1.paiId = pai.id;
	self.imgPai1.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:1] intValue]];
	self.imgPai2.paiId = pai.id;
	self.imgPai2.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:2] intValue]];
	self.imgPai3.paiId = pai.id;
	self.imgPai3.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:3] intValue]];
	self.imgPai4.paiId = pai.id;
	self.imgPai4.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:4] intValue]];
	self.imgPai5.paiId = pai.id;
	self.imgPai5.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:5] intValue]];
	self.imgPai6.paiId = pai.id;
	self.imgPai6.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:6] intValue]];
	self.imgPai7.paiId = pai.id;
	self.imgPai7.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:7] intValue]];
	self.imgPai8.paiId = pai.id;
	self.imgPai8.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:8] intValue]];
	self.imgPai9.paiId = pai.id;
	self.imgPai9.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:9] intValue]];
	self.imgPai10.paiId = pai.id;
	self.imgPai10.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:10] intValue]];
	self.imgPai11.paiId = pai.id;
	self.imgPai11.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:11] intValue]];
	self.imgPai12.paiId = pai.id;
	self.imgPai12.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:12] intValue]];
	self.imgPai13.paiId = pai.id;
	self.imgPai13.image = pai.pai_image;
	pai = [CONST lookupPaiForKey:q.tsumo];
	self.imgPaiTsumo.paiId = pai.id;
	self.imgPaiTsumo.image = pai.pai_image;
	
	int dora_count = [q.dora count];
	for (int i=0; i<dora_count; i++) {
		int dora = [[q.dora objectAtIndex:i] intValue];
		pai = [CONST lookupPaiForKey:dora];
		switch (i) {
			case 0:
				self.imgPaiDora1.image = pai.pai_image;
				break;
			case 1:
				self.imgPaiDora2.image = pai.pai_image;
				break;
			case 2:
				self.imgPaiDora3.image = pai.pai_image;
				break;
			case 3:
				self.imgPaiDora4.image = pai.pai_image;
				break;
			default:
				break;
		}
	}
	
	NSString* dateStr = [Utils dateToString:q.date];
	self.labelAuthor.text = [NSString stringWithFormat:@"%@ posted by %@", dateStr, q.author];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

/**
 * タッチイベント開始
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
	
	// タッチされた麻雀牌を記憶しておく(牌の位置を元に戻すために使用)
	for (id obj in [touches allObjects]) {
		if ([obj isKindOfClass:[UITouch class]]) {
			UITouch* touch = (UITouch*)obj;
			if ([touch.view isKindOfClass:[UIPaiImageView class]]) {
				// 麻雀牌画像をタッチされた場合のみ実行
				if (self.selectedPaiImageView != nil && 
					[self.selectedPaiImageView isKindOfClass:[UIPaiImageView class]] &&
					self.selectedPaiImageView != touch.view) {
					// 選択していた牌を元に戻す
					UIPaiImageView* paiImageView = (UIPaiImageView*)self.selectedPaiImageView;
					[paiImageView reset];
				}
			
				// 現在選択した牌を保持
				self.selectedPaiImageView = touch.view;
			}
		}
	}
}

/**
 * ボタンタッチイベント
 */
- (IBAction)tapPostButton {
	if (self.selectedPaiImageView != nil) {
		UIPaiImageView* paiImageView = (UIPaiImageView*)self.selectedPaiImageView;
		NSLog(@"選択牌 = %d", paiImageView.paiId);
	}
}

@end
