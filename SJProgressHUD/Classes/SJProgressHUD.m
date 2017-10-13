//
//  SJProgressHUD.m
//  Pods
//
//  Created by SDPMobile on 2017/10/12.
//
//

#import "SJProgressHUD.h"

@interface SJProgressHUD ()
/**  图片数组 **/
@property (nonatomic, strong) NSArray *images;
/**  图片视图 **/
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation SJProgressHUD
#pragma mark - 单例模式
+ (SJProgressHUD *)sharedWithImages:(NSArray *)images {
    static SJProgressHUD *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] initWithImages:images];
        }
    });
    return sharedInstance;
}

#pragma mark - 初始化方法
- (instancetype)initWithImages:(NSArray *)images {
    self = [super init];
    if (self) {
        // 设置图片数组
        _images = images;
        // 设置子视图
        [self initSubviews];
    }
    return self;
}

#pragma mark - 设置子视图
- (void)initSubviews {
    self.frame = [UIScreen mainScreen].bounds;
    
    // 遮罩层
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self addSubview:effectView];
    
    // 中间内容视图
    CGSize firstImageSize = ((UIImage *)[_images firstObject]).size;
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, firstImageSize.width, firstImageSize.height)];
    contentView.center = self.center;
    [self addSubview:contentView];
    // 图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:contentView.bounds];
    imageView.animationImages = _images;
    imageView.animationDuration = 1;
    imageView.animationRepeatCount = 0;
    
    if (imageView.animating == NO) {
        [imageView startAnimating];
    }
    _imageView = imageView;
    [contentView addSubview:_imageView];
}

#pragma mark - 展示视图
- (void)show {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    });
}

#pragma mark - 隐藏视图
- (void)hide {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

#pragma mark - 移除视图
- (void)removeFromSuperview {
    [super removeFromSuperview];
    if (_imageView.animating == YES) {
        [_imageView stopAnimating];
    }
}

@end
