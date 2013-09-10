//
//  UIColor-HSB.h
//
//  Created by Bill Shirley on 11/23/11.
//

#import <UIKit/UIKit.h>

@interface UIColor (HSB)

- (BOOL)canProvideHSBComponents;

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 50000
- (BOOL)getHue:(CGFloat *)h saturation:(CGFloat *)s brightness:(CGFloat *)v alpha:(CGFloat *)a;
#endif

- (CGFloat)hue;
- (CGFloat)saturation;
- (CGFloat)brightness;

@end
