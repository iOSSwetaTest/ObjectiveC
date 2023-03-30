//
//  ApiClient.h
//  StarWars
//
//  Created by shweta dodiya on 2023-03-29.
//

#import "BasePaginationModel.h"

@protocol FetchDataDelegate <NSObject>
@required

- (void)getPagination:(BasePaginationModel*)result withError:(NSError *)error;
@end


@interface ApiClient : NSObject {
    
}
@property (unsafe_unretained) id <FetchDataDelegate> delegate;

-(void)loadDatafrom:(NSURL *)url;
@end
