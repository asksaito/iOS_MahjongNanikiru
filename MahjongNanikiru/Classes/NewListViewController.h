//
//  NewListViewController.h
//  MahjongNanikiru
//
//  Created by 西藤 英介 on 11/05/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView* newListTableView;
	NSArray* questionList;
}
@property (nonatomic, retain) NSArray* questionList;

@end
