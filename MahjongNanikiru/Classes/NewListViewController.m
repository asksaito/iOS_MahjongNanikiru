    //
//  NewListViewController.m
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewListViewController.h"
#import "SimpleCellViewController.h"
#import "DetailViewController.h"

#import "Utils.h"
#import "MahjongConst.h"
#import "QuestionGAEServer.h"

@implementation NewListViewController
@synthesize questionList;

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	newListTableView.dataSource = self;
	newListTableView.delegate = self;
	
	// 各セルの高さ(可変長にしたい)
	newListTableView.rowHeight = 80;
	
	//QuestionGAEServer* server = [[QuestionGAEServer alloc] init];
	QuestionGAEServer* server = [QuestionGAEServer sharedInstance];
	self.questionList = [server getNewList];
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


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	// テーブルビューの背景色を変更する
    //cell.backgroundColor = [UIColor blackColor];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
	return 10;
}


- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
	static NSString* cellIdentifier = @"Cell";
	
	SimpleCellViewController* cell = (SimpleCellViewController*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		UIViewController* vc;
		vc = [[UIViewController alloc] initWithNibName: @"SimpleCell" bundle:nil];
		cell = (SimpleCellViewController*)vc.view;
		
		// セルのカスタマイズ
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		/*
		 cell.labelNo.textColor = [UIColor whiteColor];
		 cell.labelBakyo.textColor = [UIColor whiteColor];
		 cell.labelComment.textColor = [UIColor whiteColor];
		 cell.labelAuthor.textColor = [UIColor whiteColor];
		 */
	}
	
	if([self.questionList count] > indexPath.row) {
		Question* q = [self.questionList objectAtIndex:indexPath.row];
		cell.labelNo.text = [NSString stringWithFormat:@"No.%04d", q.no];
		cell.labelBakyo.text = [NSString stringWithFormat:@"東%d局 %d本場 %d巡目 %d点 %d家", q.bakyo, q.honba, q.junme, q.tenbo, q.cha];
		cell.labelTitle.text = q.title;
		MahjongConst* CONST = [MahjongConst sharedInstance];
		PAI* pai;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:0] intValue]];
		cell.imgPai1.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:1] intValue]];
		cell.imgPai2.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:2] intValue]];
		cell.imgPai3.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:3] intValue]];
		cell.imgPai4.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:4] intValue]];
		cell.imgPai5.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:5] intValue]];
		cell.imgPai6.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:6] intValue]];
		cell.imgPai7.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:7] intValue]];
		cell.imgPai8.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:8] intValue]];
		cell.imgPai9.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:9] intValue]];
		cell.imgPai10.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:10] intValue]];
		cell.imgPai11.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:11] intValue]];
		cell.imgPai12.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:[[q.tehai objectAtIndex:12] intValue]];
		cell.imgPai13.image = pai.pai_image;
		pai = [CONST lookupPaiForKey:q.tsumo];
		cell.imgPaiTsumo.image = pai.pai_image;
	
		NSString* dateStr = [Utils dateToString:q.date];
		cell.labelAuthor.text = [NSString stringWithFormat:@"%@ posted by %@", dateStr, q.author];
	}
	
	return cell;
}

// セルを選択したときに呼ばれるデリゲート
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row >= [self.questionList count]) {
		return;
	}
	
	// 詳細画面
	DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
	// 次の画面ではタブバーを隠す
	[detailViewController setHidesBottomBarWhenPushed:YES];
	
	// プロパティ経由で値を受け渡し
	Question* q = [self.questionList objectAtIndex:indexPath.row];
	detailViewController.no = q.no;
	
	
	// 詳細画面を表示する
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];
}

@end
