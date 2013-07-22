//
//  SBBarButtonItem.m
//
//  Created by Pierluigi Cifani on 2/12/13.

//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/

#import "SBBarButtonItem.h"
#import "SBBadgeView.h"
#import <QuartzCore/QuartzCore.h>

@interface SBBarButtonItem ()
@property (nonatomic, strong) UIImage *originalImage;
@end

@implementation SBBarButtonItem

+ (instancetype) buttonWithTarget:(id)target action:(SEL)action image:(UIImage *)image;
{
    SBBarButtonItem *button = [[SBBarButtonItem alloc] initWithImage:image
                                                               style:UIBarButtonItemStylePlain
                                                              target:target
                                                              action:action];
    button.originalImage = image;
    
    return button;
}

- (void) setBadgeValue:(NSInteger)badgeValue
{
    if (badgeValue == 0)
    {
        [self removeBadgeValue];
    }
    else
    {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            UIImage *orginalImage = self.originalImage;

            SBBadgeView *badgeView = [[SBBadgeView alloc] initWithFrame:CGRectMake(16, 3, 14, 14)
                                                                  value:badgeValue];
            
            UIImageView *imageView = [[UIImageView alloc] initWithImage:orginalImage];
            [imageView addSubview:badgeView];
            
            UIGraphicsBeginImageContextWithOptions((imageView.bounds.size), NO, [[UIScreen mainScreen] scale]);
            [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setImage:viewImage];
            });
        });
    }
}

- (void) removeBadgeValue
{
    [self setImage:_originalImage];
}

@end
