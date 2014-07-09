//
//  LFPMacroDefine.h
//  LookForPlace
//
//  Created by 马远征 on 14-7-10.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#ifndef LookForPlace_LFPMacroDefine_h
#define LookForPlace_LFPMacroDefine_h



#ifdef DEBUG
#   define DEBUG_STR(...) NSLog(__VA_ARGS__);
#   define DEBUG_METHOD(format, ...) NSLog(format, ##__VA_ARGS__);
#else
#   define DEBUG_STR(...) NSLog(__VA_ARGS__);
#   define DEBUG_METHOD(format, ...) NSLog(format, ##__VA_ARGS__);
#endif

#define LogFUNC DEBUG_METHOD(@"---%s----",__FUNCTION__)

#define IS_IPHONE_5   (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )568) < DBL_EPSILON )
#define KScreenWidth  [[UIScreen mainScreen]bounds].size.width
#define KScreenHeight [[UIScreen mainScreen]bounds].size.height
#define iOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0

#define RGBColor(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]

#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

#endif
