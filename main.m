//
//  main.m
//  Block
//
//  Created by DingTalk on 2020/5/28.
//  Copyright © 2020 DingTalk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int (^blk_t)(int);
int global_val=1;
static int static_global_val=2;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int dmy = 256;
        int val =10;
        const char *fmt = "val=%d\n";
        void (^blk)(void) = ^{printf(fmt,val);};   //Block变量
        
        val = 2;
        fmt = "These values were changed. val=%d\n";
        
        blk();
        
        __block int val2 = 0;
        void (^blk2)(void) = ^{val2=1;};
        blk2();
        printf("val=%d\n",val2);
        
        static int static_val=3;
        
        void (^blk3)(void)=^{
            global_val *=1;
            static_global_val *=2;
            static_val *=3;
        };
        blk3();
        printf("global_val=%d\n,static_global_val=%d\n,static_val=%d\n",global_val,static_global_val,static_val);
        
    }
    return 0;
}
