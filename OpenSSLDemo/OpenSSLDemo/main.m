//
//  main.m
//  OpenSSLDemo
//
//  Created by kingly on 15/11/23.
//  Copyright © 2015年 kingly. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#include <openssl/aes.h>
//#include <stdio.h>
//#include <stdlib.h>
//typedef unsigned char uchar;
//
//// Fill in actual key here
//static const uchar ckey[] = "\x12\x12";
//
//void print(const char *str, uchar *in, uchar *out)
//{
//    // Print in hex because encrypted data is not always ASCII-friendly ;-)
//    
//    int i;
//    
//    printf("%s\n", str);
//    printf("Input:\t");
//    for (i = 0; i < AES_BLOCK_SIZE; i++)
//    printf("%x", in[i]);
//    printf("\n");
//    printf("Output:\t");
//    for (i = 0; i < AES_BLOCK_SIZE; i++)
//        printf("%x", out[i]);
//    printf("\n\n");
//}
//
//void Encrypt(uchar *in, uchar *out, int debug)
//{
//    static int firstRun = 1;
//    static AES_KEY encryptKey;
//    
//    if (firstRun == 1)
//    {
//        AES_set_encrypt_key(ckey, 256, &encryptKey);
//        firstRun = 0;
//    }
//    
//    AES_ecb_encrypt(in, out, &encryptKey, AES_ENCRYPT);
//    
////    if (debug)
//        print("Encryption:", in, out);
//
//}
//
//void Decrypt(uchar *in, uchar *out, int debug)
//{
//    static int firstRun = 1;
//    static AES_KEY decryptKey;
//    
//    if (firstRun == 1)
//    {
//        AES_set_decrypt_key(ckey, 256, &decryptKey);
//        firstRun = 0;
//    }
//    
//    AES_ecb_encrypt(in, out, &decryptKey, AES_DECRYPT);
//    
////    if (debug)
//        print("Decryption:", in, out);
//}

//void Encrypt32(uchar *in, uchar *out, int debug)
//{
//    static int firstRun = 1;
//    static AES_KEY encryptKey;
//    
//    if (firstRun == 1)
//    {
//        AES_set_encrypt_key(ckey, 256, &encryptKey);
//        firstRun = 0;
//    }
//    
//    AES_ecb_encrypt(in, out, &encryptKey, AES_ENCRYPT);
//    AES_ecb_encrypt(&in[AES_BLOCK_SIZE], &out[AES_BLOCK_SIZE], &encryptKey, AES_ENCRYPT);
//    
//    if (debug)
//        print("Encryption:", in, out);
//}
//
//void Decrypt32(uchar *in, uchar *out, int debug)
//{
//    static int firstRun = 1;
//    static AES_KEY decryptKey;
//    
//    if (firstRun == 1)
//    {
//        AES_set_decrypt_key(ckey, 256, &decryptKey);
//        firstRun = 0;
//    }
//    
//    AES_ecb_encrypt(in, out, &decryptKey, AES_DECRYPT);
//    AES_ecb_encrypt(&in[AES_BLOCK_SIZE], &out[AES_BLOCK_SIZE], &decryptKey, AES_DECRYPT);
//    
//    if (debug)
//        print("Decryption:", in, out);
//}
//
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
//    int BLOCKS = 1e6, PRINT = 0, i;
//    
//    argc--; argv++;
//    while (argc > 0)
//    {
//        if ((*argv)[0] == '-')
//        {
//            if (!strcmp(*argv, "-help")) { printf("Usage: AES [-trials N] [-print]"); exit(0); }
//            else if (!strcmp(*argv, "-trials")) { argc--; argv++; BLOCKS = atoi(*argv); }
//            else if (!strcmp(*argv, "-print")) { PRINT = 1; }
//            else { fprintf(stderr, "Invalid program argument: %s", *argv); exit(0); }
//        }
//        
//        argv++;
//        argc--;
//    }
//    
//    // Sample input
//    uchar in[2 * AES_BLOCK_SIZE] = "helloworld1234\nhelloworld1234\n";
//    uchar out[2 * AES_BLOCK_SIZE];
//    
//    
//    
//    printf("Running %d trials...\n", BLOCKS);
//    
//     Encrypt(in, out, PRINT);
//     Decrypt(out, in, PRINT);
//    
//    // Run trials
////    for (i = 0; i < BLOCKS; i++)
////    {
////        Encrypt(in, out, PRINT);
////        Decrypt(out, in, PRINT);
////    }
//    
//    
//    printf("Completed encryption and decryption of %d blocks.\n", BLOCKS);
//    
//    return 0;
//}


#import <UIKit/UIKit.h>
#import <openssl/md5.h>
#import "AppDelegate.h"
#include <openssl/aes.h>
#include <stdio.h>
#include <stdlib.h>

void Md5( NSString *);

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"s测试");
        Md5 (@"12345" );
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    
//     int retVal = UIApplicationMain (argc, argv, nil , nil );
//    [pool release ];
//    return retVal;
}


void Md5( NSString * string){
    // 输入参数 1 ：要生成 md5 值的字符串， NSString-->uchar*
    unsigned char *inStrg = ( unsigned char *)[[string dataUsingEncoding :NSASCIIStringEncoding ] bytes];
    // 输入参数 2 ：字符串长度
    unsigned long lngth = [string length];
    // 输出参数 3 ：要返回的 md5 值， MD5_DIGEST_LENGTH 为 16bytes ， 128 bits
    unsigned char result[ MD5_DIGEST_LENGTH ];
    // 临时 NSString 变量，用于把 uchar* 组装成可以显示的字符串： 2 个字符一 byte 的 16 进制数
    NSMutableString *outStrg = [ NSMutableString string ];
     // 调用 OpenSSL 函数
    MD5 (inStrg, lngth, result);

    unsigned int i;
    
    for (i = 0; i < MD5_DIGEST_LENGTH ; i++)
    {
        
        [outStrg appendFormat : @"%02x" , result[i]];
    }
    NSLog ( @"input string:%@" ,string);
    NSLog ( @"md5:%@" ,outStrg);
    
}