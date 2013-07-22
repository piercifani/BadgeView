//
//  SBBadgeView.m
//  Created by Pierluigi Cifani on 2/12/13.

//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/

#import "SBBadgeView.h"

#define kBadgeImage [UIImage imageNamed:@"badge"]

@implementation SBBadgeView

- (id)initWithFrame:(CGRect)frame value:(NSInteger)value;
{
    self = [super initWithImage:kBadgeImage];
    if (self) {
        // Initialization code
        [self setFrame:frame];
        
        UILabel *badgeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [badgeValueLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [badgeValueLabel setTextColor:[UIColor whiteColor]];
        [badgeValueLabel setBackgroundColor:[UIColor clearColor]];
        [badgeValueLabel setTextAlignment:NSTextAlignmentCenter];
        
        NSString *badgeValueText = [NSString stringWithFormat:@"%d", value];
        [badgeValueLabel setText:badgeValueText];
        
        [self addSubview:badgeValueLabel];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
