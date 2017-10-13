//
//  SJProgressHUD.h
//  Pods
//
//  Created by SDPMobile on 2017/10/12.
//
//

#import <UIKit/UIKit.h>

@interface SJProgressHUD : UIView
/*
 *  单例模式
 *  @param  images  图片数组
 */
+ (SJProgressHUD *)sharedWithImages:(NSArray *)images;

/*
 *  展示视图
 */
- (void)show;

/*
 *  隐藏视图
 */
- (void)hide;
@end
