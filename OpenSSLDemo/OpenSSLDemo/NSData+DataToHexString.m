//
//  NSData+DataToHexString.m
//  KitMate
//
//  Created by kingly on 15/1/14.
//  Copyright (c) 2015年 com.intervalintl. All rights reserved.
//

#import "NSData+DataToHexString.h"

@implementation NSData (DataToHexString)


- (NSString *) dataToHexString
{
    NSUInteger          len = [self length];
    char *              chars = (char *)[self bytes];
    NSMutableString *   hexString = [[NSMutableString alloc] init];
    
    for(NSUInteger i = 0; i < len; i++ )
        [hexString appendString:[NSString stringWithFormat:@"%0.2hhx", chars[i]]];
    
    return hexString;
}

// Data转换为十六进制的。
+ (NSString *)hexDataFromString:(NSData *)sendData{
    
    Byte *bytes = (Byte *)[sendData bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[sendData length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}



@end
