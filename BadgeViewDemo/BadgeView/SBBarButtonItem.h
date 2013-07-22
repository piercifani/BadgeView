//
//  SBBarButtonItem.h
//
//  Created by Pierluigi Cifani on 2/12/13.

//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/

#import <UIKit/UIKit.h>

/*
 This subclass of UIBarButtonItem implements simple badging and 
 is as unobtrusive as possible since it  doesn't use a background
 and can blend with any tintColor set on the UINavigationBar
 */

@interface SBBarButtonItem : UIBarButtonItem

// Designated initializer
+ (instancetype) buttonWithTarget:(id)target action:(SEL)action image:(UIImage *)image;

// Sets the badge value. In order to clear the badge, pass zero (0) as the badgeValue param
- (void) setBadgeValue:(NSInteger)badgeValue;

@end
