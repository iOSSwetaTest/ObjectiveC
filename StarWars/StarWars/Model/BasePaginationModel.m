#import <Foundation/Foundation.h>
#import "BasePaginationModel.h"
@implementation BasePaginationModel

@synthesize count;
@synthesize next;
@synthesize previous;
@synthesize results;


- (void)setupWithJsonDictionary:(NSDictionary *)jsonDict {
    
    self.count = (NSNumber *)[jsonDict valueForKey:@"count"];
    self.next = [NSURL URLWithString:[jsonDict valueForKey:@"next"]];
    if (![[jsonDict valueForKey:@"previous"] isEqual:[NSNull null]] )  {
        self.previous = [NSURL URLWithString:[jsonDict valueForKey:@"previous"]];
    }
    self.results = [jsonDict valueForKey:@"results"];
}
@end
