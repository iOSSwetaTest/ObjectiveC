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
    
    characterList = [[NSMutableArray alloc] init];
    apiClient = [[ApiClient alloc] init];
    
    apiClient.delegate = self;
}


- (void)viewWillAppear:(BOOL)animated {
    [self reloadTable];
}

#pragma mark - Call HTTP class to get characterlist

- (IBAction)reloadTable {
    [loader startAnimating];
    [apiClient loadDatafrom:[self returnUrl]];
}

-(NSURL *)returnUrl {
    if (characterList.count == 0) {
        return [NSURL URLWithString:@"https://swapi.dev/api/people/?page=1"];
    } else {
        return nextPageUrl;
        
    }
}

#pragma mark - Delegate method for API Client

- (void)getPagination:(BasePaginationModel*)result withError:(NSError *)error {
    [loader stopAnimating];
    
    if (!error) {
        [characterList addObjectsFromArray: result.results];
        nextPageUrl = result.next;
        [self.tableView reloadData];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Please try later"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
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
