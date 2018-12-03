//
//  ffmpegTool.m
//  ffmpeg_ios
//
//  Created by Yang Jiangang on 2018/12/2.
//  Copyright © 2018 Yang Jiangang. All rights reserved.
//

#import "ffmpegTool.h"

#include <libavformat/avformat.h>
#include "ffmpeg.h"

int ffmpeg_main(int argc, char **argv,void (^progressBlock)(float seconds,int result));

@implementation ffmpegTool

+ (BOOL)ffmpeg:(NSString *)str progress:(void(^)(float progress,int result))progress
{
    @autoreleasepool {
        
        NSString *command_str = [NSString stringWithFormat:@"%@",str];
        
        NSArray *argv_array = [command_str componentsSeparatedByString:(@" ")];
        
        int argc = argv_array.count;
        
        char** argv = (char**)malloc(sizeof(char*)*argc);
        
        for(int i = 0; i < argc; i++)
        {
            argv[i] = (char*)malloc(sizeof(char)*1024);
            strcpy(argv[i],[[argv_array objectAtIndex:i] UTF8String]);
        }
        
        int result = ffmpeg_main(argc, argv, ^(float seconds,int result) {
            if (progress) {
                progress(seconds,result);
            }
        });
        
        for(int i=0 ; i < argc; i++)
            free(argv[i]);
        free(argv);
        command_str = nil;
        argv_array = nil;
        
        return !result;
        
    }
}

@end
