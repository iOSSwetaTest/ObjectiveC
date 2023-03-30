
@interface BasePaginationModel : NSObject
@property (nonatomic) NSNumber* count;
@property (nonatomic, strong) NSURL * next;
@property (nonatomic, strong) NSURL * previous;
@property (nonatomic, strong) NSMutableArray * results;

- (void)setupWithJsonDictionary:(NSDictionary *)jsonDict;

@end
