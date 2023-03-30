//
//  ViewController.h
//  StarWars
//
//  Created by shweta dodiya on 2023-03-29.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "ApiClient.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,FetchDataDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;
@property (strong, nonatomic) NSMutableArray *characterList;
@property (strong, nonatomic) NSURL *nextPageUrl;
@property (strong, nonatomic) ApiClient *apiClient;

@end

