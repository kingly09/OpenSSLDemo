//
//  NSData+DataToHexString.h
//  KitMate
//
//  Created by kingly on 15/1/14.
//  Copyright (c) 2015年 com.intervalintl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DataToHexString)
/**
 * NSData转十六制字符
 **/
- (NSString *) dataToHexString;
+ (NSString *)hexDataFromString:(NSData *)sendData;


@end
