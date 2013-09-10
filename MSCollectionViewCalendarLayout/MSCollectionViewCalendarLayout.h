//
//  MSCollectionViewCalendarLayout.h
//  MSCollectionViewCalendarLayout
//
//  Created by Eric Horacek on 2/18/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//
//  This code is distributed under the terms and conditions of the MIT license.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <UIKit/UIKit.h>

extern NSString *const MSCollectionElementKindTimeRowHeader;
extern NSString *const MSCollectionElementKindDayColumnHeader;
extern NSString *const MSCollectionElementKindTimeRowHeaderBackground;
extern NSString *const MSCollectionElementKindDayColumnHeaderBackground;
extern NSString *const MSCollectionElementKindCurrentTimeIndicator;
extern NSString *const MSCollectionElementKindCurrentTimeHorizontalGridline;
extern NSString *const MSCollectionElementKindVerticalGridline;
extern NSString *const MSCollectionElementKindHorizontalGridline;

typedef NS_ENUM(NSUInteger, MSSectionLayoutType) {
    MSSectionLayoutTypeHorizontalTile,
    MSSectionLayoutTypeVerticalTile
};

typedef NS_ENUM(NSUInteger, MSHeaderLayoutType) {
    MSHeaderLayoutTypeTimeRowAboveDayColumn,
    MSHeaderLayoutTypeDayColumnAboveTimeRow
};

@class MSCollectionViewCalendarLayout;
@protocol MSCollectionViewDelegateCalendarLayout;

@interface MSCollectionViewCalendarLayout : UICollectionViewLayout

@property (nonatomic, weak) id <MSCollectionViewDelegateCalendarLayout> delegate;

@property (nonatomic, assign) CGFloat sectionWidth;
@property (nonatomic, assign) CGFloat hourHeight;
@property (nonatomic, assign) CGFloat dayColumnHeaderHeight;
@property (nonatomic, assign) CGFloat timeRowHeaderWidth;
@property (nonatomic, assign) CGSize currentTimeIndicatorSize;
@property (nonatomic, assign) CGFloat horizontalGridlineHeight;
@property (nonatomic, assign) CGFloat verticalGridlineWidth;
@property (nonatomic, assign) CGFloat currentTimeHorizontalGridlineHeight;
@property (nonatomic, assign) UIEdgeInsets sectionMargin;
@property (nonatomic, assign) UIEdgeInsets contentMargin;
@property (nonatomic, assign) UIEdgeInsets cellMargin;
@property (nonatomic, assign) MSSectionLayoutType sectionLayoutType;
@property (nonatomic, assign) MSHeaderLayoutType headerLayoutType;
@property (nonatomic, assign) BOOL displayHeaderBackgroundAtOrigin;

- (NSDate *)dateForTimeRowHeaderAtIndexPath:(NSIndexPath *)indexPath;
- (NSDate *)dateForDayColumnHeaderAtIndexPath:(NSIndexPath *)indexPath;

- (void)scrollCollectionViewToClosetSectionToCurrentTimeAnimated:(BOOL)animated;

// Since a "reloadData" on the UICollectionView doesn't call "prepareForCollectionViewUpdates:", this method must be called first to flush the internal caches
- (void)invalidateLayoutCache;

@end

@protocol MSCollectionViewDelegateCalendarLayout <UICollectionViewDelegate>

@required

- (NSDate *)collectionView:(UICollectionView *)collectionView layout:(MSCollectionViewCalendarLayout *)collectionViewLayout dayForSection:(NSInteger)section;
- (NSDate *)collectionView:(UICollectionView *)collectionView layout:(MSCollectionViewCalendarLayout *)collectionViewLayout startTimeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSDate *)collectionView:(UICollectionView *)collectionView layout:(MSCollectionViewCalendarLayout *)collectionViewLayout endTimeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSDate *)currentTimeComponentsForCollectionView:(UICollectionView *)collectionView layout:(MSCollectionViewCalendarLayout *)collectionViewLayout;

@end
