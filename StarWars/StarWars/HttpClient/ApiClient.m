#import <Foundation/Foundation.h>
#import "ApiClient.h"

@implementation ApiClient


- (id)init
{
    self = [super init];
    
    if(self)
    {
    }
    
    return self;
}


-(void)loadDatafrom:(NSURL *)url {
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];

        // Setup the request with URL
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];

        // Convert GET string parameters to data using UTF8 Encoding
        [urlRequest setHTTPMethod:@"GET"];

        // Create dataTask
        NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];

            dispatch_async(dispatch_get_main_queue(), ^{
                BasePaginationModel *clientObj = [[BasePaginationModel alloc] init];
                [clientObj setupWithJsonDictionary:results];
                [self.delegate getPagination:clientObj withError: error];
            });
        }];

        // Fire the request
        [dataTask resume];
}
@end
