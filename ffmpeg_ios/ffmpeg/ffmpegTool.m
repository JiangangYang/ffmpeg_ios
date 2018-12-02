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

int ffmpeg_main(int argc, char **argv);

@implementation ffmpegTool

+ (BOOL)ffmpeg:(NSString *)str
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
        
        int result = ffmpeg_main(argc, argv);
        
        for(int i=0 ; i < argc; i++)
            free(argv[i]);
        free(argv);
        command_str = nil;
        argv_array = nil;
        
        return !result;
        
    }
}

+ (BOOL)gifToMp4:(NSString *)inputStr output:(NSString *)outputStr
{
    @autoreleasepool {
        char *input = (char *)[inputStr UTF8String];
        char *output = (char *)[outputStr UTF8String];
        char* a[] = {
            "ffmpeg",
            "-f",
            "gif",
            "-i",
            input,
            output
        };
        return !ffmpeg_main(sizeof(a)/sizeof(*a), a);
    }
}

+ (BOOL)transcode:(NSString *)str output:(NSString *)outputStr
{
    @autoreleasepool {
        char *outPic = (char *)[outputStr UTF8String];
        char *movie = (char *)[str UTF8String];
        char *filter = "crop=in_w/2:in_h/2:(in_w-out_w)/2+((in_w-out_w)/2)*sin(n/10):(in_h-out_h)/2 +((in_h-out_h)/2)*sin(n/7)";
        char* a[] = {
            "ffmpeg",
            "-i",
            movie,
            "-vf",
            filter,
            outPic
        };
        return !ffmpeg_main(sizeof(a)/sizeof(*a), a);
    }
}

@end
