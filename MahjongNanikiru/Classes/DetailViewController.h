//
//  DetailViewController.h
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "UIPaiImageView.h"

@interface DetailViewController : UIViewController {
	IBOutlet UILabel* labelNo;
	IBOutlet UILabel* labelBakyo;
	IBOutlet UILabel* labelDetail;
	IBOutlet UIPaiImageView* imgPai1;
	IBOutlet UIPaiImageView* imgPai2;
	IBOutlet UIPaiImageView* imgPai3;
	IBOutlet UIPaiImageView* imgPai4;
	IBOutlet UIPaiImageView* imgPai5;
	IBOutlet UIPaiImageView* imgPai6;
	IBOutlet UIPaiImageView* imgPai7;
	IBOutlet UIPaiImageView* imgPai8;
	IBOutlet UIPaiImageView* imgPai9;
	IBOutlet UIPaiImageView* imgPai10;
	IBOutlet UIPaiImageView* imgPai11;
	IBOutlet UIPaiImageView* imgPai12;
	IBOutlet UIPaiImageView* imgPai13;
	IBOutlet UIPaiImageView* imgPaiTsumo;
	IBOutlet UIImageView* imgPaiDora1;
	IBOutlet UIImageView* imgPaiDora2;
	IBOutlet UIImageView* imgPaiDora3;
	IBOutlet UIImageView* imgPaiDora4;
	IBOutlet UILabel* labelAuthor;

	int no;
	//Question* question;
	UIView* selectedPaiImageView;
}
@property (nonatomic, retain) IBOutlet UILabel* labelNo;
@property (nonatomic, retain) IBOutlet UILabel* labelBakyo;
@property (nonatomic, retain) IBOutlet UILabel* labelDetail;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai1;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai2;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai3;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai4;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai5;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai6;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai7;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai8;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai9;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai10;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai11;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai12;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPai13;
@property (nonatomic, retain) IBOutlet UIPaiImageView* imgPaiTsumo;
@property (nonatomic, retain) IBOutlet UIImageView* imgPaiDora1;
@property (nonatomic, retain) IBOutlet UIImageView* imgPaiDora2;
@property (nonatomic, retain) IBOutlet UIImageView* imgPaiDora3;
@property (nonatomic, retain) IBOutlet UIImageView* imgPaiDora4;
@property (nonatomic, retain) IBOutlet UILabel* labelAuthor;

@property (nonatomic) int no;
//@property (nonatomic, retain) Question* question;
@property (nonatomic, retain) IBOutlet UIView* selectedPaiImageView;

//- (void) setSelectedPaiImageView:(UIPaiImageView *) paiImageView;
- (IBAction)tapPostButton;

@end
