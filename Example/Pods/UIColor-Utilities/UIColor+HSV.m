//
//  UIColor-HSB.m
//
//  Created by Bill Shirley on 11/23/11.
//

#import "UIColor+HSV.h"
#import "UIColor+Expanded.h"

@implementation UIColor (HSB)

/* Functions from Dustin at
 http://stackoverflow.com/questions/5284427/how-do-i-get-the-hue-saturation-and-brightness-from-a-uicolor
 */
static void RGBtoHSV( CGFloat r, CGFloat g, CGFloat b, CGFloat *h, CGFloat *s, CGFloat *v )
{
  float min, max, delta;
  min = MIN( r, MIN( g, b ));
  max = MAX( r, MAX( g, b ));
  *v = max;               // v
  delta = max - min;
  if( max != 0 )
    *s = delta / max;       // s
  else {
    // r = g = b = 0        // s = 0, v is undefined
    *s = 0;
    *h = -1;
    return;
  }
  if( r == max )
    *h = ( g - b ) / delta;     // between yellow & magenta
  else if( g == max )
    *h = 2 + ( b - r ) / delta; // between cyan & yellow
  else
    *h = 4 + ( r - g ) / delta; // between magenta & cyan
  *h /= 6;               // 360 degrees - scaled to 0-1
  if( *h < 0 )
    *h += 1;
}

static void HSVtoRGB( CGFloat *r, CGFloat *g, CGFloat *b, CGFloat h, CGFloat s, CGFloat v )
{
  /// NOT converted to use the 0-1 Hue
  int i;
  float f, p, q, t;
  if( s == 0 ) {
    // achromatic (grey)
    *r = *g = *b = v;
    return;
  }
  h /= 60;            // sector 0 to 5
  i = floor( h );
  f = h - i;          // factorial part of h
  p = v * ( 1 - s );
  q = v * ( 1 - s * f );
  t = v * ( 1 - s * ( 1 - f ) );
  switch( i ) {
    case 0:
      *r = v;
      *g = t;
      *b = p;
      break;
    case 1:
      *r = q;
      *g = v;
      *b = p;
      break;
    case 2:
      *r = p;
      *g = v;
      *b = t;
      break;
    case 3:
      *r = p;
      *g = q;
      *b = v;
      break;
    case 4:
      *r = t;
      *g = p;
      *b = v;
      break;
    default:        // case 5:
      *r = v;
      *g = p;
      *b = q;
      break;
  }
}

- (BOOL)canProvideHSBComponents {
	switch (self.colorSpaceModel) {
		case kCGColorSpaceModelRGB:
		case kCGColorSpaceModelMonochrome:
			return YES;
		default:
			return NO;
	}
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 50000
- (BOOL)getHue:(CGFloat *)h saturation:(CGFloat *)s brightness:(CGFloat *)v alpha:(CGFloat *)a {
  CGFloat r, g, b;
  BOOL result = [self red:&r green:&g blue:&b alpha:a];
  if (result == NO)
    return NO;
  
  RGBtoHSV(r, g, b, h, s, v);
  return YES;
}
#endif

- (CGFloat)hue {
  CGFloat h, s, v, a;
  [self getHue:&h saturation:&s brightness:&v alpha:&a];
  return h;
}

- (CGFloat)saturation {
  CGFloat h, s, v, a;
  [self getHue:&h saturation:&s brightness:&v alpha:&a];
  return s;
}

- (CGFloat)brightness {
  CGFloat h, s, v, a;
  if (![self getHue:&h saturation:&s brightness:&v alpha:&a]) {
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if ([self colorSpaceModel] == kCGColorSpaceModelMonochrome) return c[0];
  }
  return v;
}

@end
