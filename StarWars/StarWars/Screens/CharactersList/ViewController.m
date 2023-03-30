//
//  ViewController.m
//  StarWars
//
//  Created by shweta dodiya on 2023-03-29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize characterList, nextPageUrl;
@synthesize apiClient;
@synthesize loader;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
    apiClient = [[ApiClient alloc] init];
    characterList = [[NSMutableArray alloc] init];
    apiClient.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    if (characterList.count == 0) {
        [loader startAnimating];
        [apiClient loadDatafrom:[self returnUrl]];
    }
}

-(NSURL *)returnUrl {
    if (characterList.count == 0) {
        return [NSURL URLWithString:@"https://swapi.dev/api/people/?page=1"];
    } else {
        return nextPageUrl;

    }
}

- (void)getPagination:(BasePaginationModel*)result withError:(NSError *)error {
    if (!error) {
        [loader stopAnimating];
        NSLog(@"Get pagination==>%@", result);
        characterList = result.results;
        [self.tableView reloadData];
    }
   
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return characterList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.preservesSuperviewLayoutMargins = false;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.lbl.text = [[characterList objectAtIndex:indexPath.row] valueForKey:@"name"];
    // Configure the cell...
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
}
@end
