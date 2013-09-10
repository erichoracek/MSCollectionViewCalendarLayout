#import <UIKit/UIKit.h>

@interface UIColor (Expanded)

@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;
@property (nonatomic, readonly) BOOL canProvideRGBComponents;

@property (nonatomic, readonly) CGFloat red;	// Only valid if canProvideRGBComponents is YES
@property (nonatomic, readonly) CGFloat green;	// Only valid if canProvideRGBComponents is YES
@property (nonatomic, readonly) CGFloat blue;	// Only valid if canProvideRGBComponents is YES
@property (nonatomic, readonly) CGFloat white;	// Only valid if colorSpaceModel == kCGColorSpaceModelMonochrome
@property (nonatomic, readonly) CGFloat hue;
@property (nonatomic, readonly) CGFloat saturation;
@property (nonatomic, readonly) CGFloat brightness;
@property (nonatomic, readonly) CGFloat alpha;
@property (nonatomic, readonly) CGFloat luminance;
@property (nonatomic, readonly) UInt32 rgbHex;
@property (nonatomic, readonly) UInt32 rgbaHex;

- (NSString *)colorSpaceString;
- (NSArray *)arrayFromRGBAComponents;

// Bulk access to RGB and HSB components of the color
// HSB components are converted from the RGB components
- (BOOL)red:(CGFloat *)r green:(CGFloat *)g blue:(CGFloat *)b alpha:(CGFloat *)a;
- (BOOL)hue:(CGFloat *)h saturation:(CGFloat *)s brightness:(CGFloat *)b alpha:(CGFloat *)a;

// Return a grey-scale representation of the color
- (UIColor *)colorByLuminanceMapping;

// Arithmetic operations on the color
- (UIColor *)colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)       colorByAddingRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *) colorByLighteningToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)  colorByDarkeningToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

- (UIColor *)colorByMultiplyingBy:(CGFloat)f;
- (UIColor *)       colorByAdding:(CGFloat)f;
- (UIColor *) colorByLighteningTo:(CGFloat)f;
- (UIColor *)  colorByDarkeningTo:(CGFloat)f;

- (UIColor *)colorByMultiplyingByColor:(UIColor *)color;
- (UIColor *)       colorByAddingColor:(UIColor *)color;
- (UIColor *) colorByLighteningToColor:(UIColor *)color;
- (UIColor *)  colorByDarkeningToColor:(UIColor *)color;

// Returns a color the given fraction between the receiver and the
// target color. Fraction should be between 0.0 and 1.0.
- (UIColor *)colorByInterpolatingToColor:(UIColor *)color byFraction:(CGFloat)fraction;

// Related colors
- (UIColor *)contrastingColor;			// A good contrasting color: will be either black or white
- (UIColor *)complementaryColor;		// A complementary color that should look good with this color
- (NSArray*)triadicColors;				// Two colors that should look good with this color
- (NSArray*)analogousColorsWithStepAngle:(CGFloat)stepAngle pairCount:(int)pairs;	// Multiple pairs of colors

// String representations of the color
- (NSString *)stringFromColor;
- (NSString *)hexStringFromColor;
- (NSString *)hexStringFromColorAndAlpha;
- (NSString *)cssStringFromColor;

// The named color that matches this one most closely
- (NSString *)closestColorName;
- (NSString *)closestCrayonName;

// Color builders
+ (UIColor *)randomColor;
+ (UIColor *)randomHSBColor;
+ (UIColor *)randomHSBColorWithMinSaturation:(CGFloat)minSat minBrightness:(CGFloat)minBright;
+ (UIColor *)colorWithString:(NSString *)stringToConvert;
+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithRGBAHex:(UInt32)hex;
+ (UIColor *)colorWithGray:(CGFloat)gray;
+ (UIColor *)colorWithGrayHex:(UInt8)gray;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorAndAlphaWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithName:(NSString *)cssColorName;
+ (UIColor *)colorWithCSSDescription:(NSString *)cssDescription;
+ (UIColor *)crayonWithName:(NSString *)crayonColorName;

+ (UIColor *)colorWithNormalizedRGBDictionary:(NSDictionary *)colorDict;
+ (UIColor *)colorWithByteRGBDictionary:(NSDictionary *)colorDict;
+ (UIColor *)colorWithRGBDictionary:(NSDictionary *)colorDict;

// Build a color with the given HSB values
#if __IPHONE_OS_VERSION_MAX_ALLOWED < 50000
+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha;
#endif
+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;

// Low level conversions between RGB and HSB spaces
+ (void)hue:(CGFloat)h saturation:(CGFloat)s brightness:(CGFloat)v toRed:(CGFloat *)r green:(CGFloat *)g blue:(CGFloat *)b;
+ (void)red:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b toHue:(CGFloat *)h saturation:(CGFloat *)s brightness:(CGFloat *)v;

@end
