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

                dispatch_async(dispatch_get_main_queue(), ^{
                    NSDictionary *results;
                    BasePaginationModel *clientObj;
                    if (!error) {
                        results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                        clientObj = [[BasePaginationModel alloc] init];
                        [clientObj setupWithJsonDictionary:results];
                    }
    
                   
                    [self.delegate getPagination:clientObj withError: error];
                });
            
            
        }];

        // Fire the request
        [dataTask resume];
}
@end
