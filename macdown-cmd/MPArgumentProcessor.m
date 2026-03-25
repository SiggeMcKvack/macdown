//
//  MPArgumentProcessor.m
//  MacDown
//
//  Created by Tzu-ping Chung on 02/12.
//  Copyright (c) 2014 Tzu-ping Chung . All rights reserved.
//

#import "MPArgumentProcessor.h"
#import <getopt.h>
#import "MPGlobals.h"
#import "version.h"


@interface MPArgumentProcessor ()

@property (nonatomic, assign, readwrite) BOOL printsHelp;
@property (nonatomic, assign, readwrite) BOOL printsVersion;
@property (nonatomic, strong, readwrite) NSArray *arguments;

@end


@implementation MPArgumentProcessor

- (instancetype)init
{
    self = [super init];
    if (!self)
        return nil;

    _printsHelp = NO;
    _printsVersion = NO;

    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    int argc = (int)processInfo.arguments.count;
    const char **argv = malloc(sizeof(char *) * argc);
    for (int i = 0; i < argc; i++)
        argv[i] = [processInfo.arguments[i] UTF8String];

    static struct option longopts[] = {
        { "help",    no_argument, NULL, 'h' },
        { "version", no_argument, NULL, 'v' },
        { NULL,      0,           NULL,  0  }
    };

    int ch;
    optind = 1;
    while ((ch = getopt_long(argc, (char * const *)argv, "hv", longopts, NULL)) != -1) {
        switch (ch) {
            case 'h':
                _printsHelp = YES;
                break;
            case 'v':
                _printsVersion = YES;
                break;
            default:
                break;
        }
    }

    NSMutableArray *args = [NSMutableArray array];
    for (int i = optind; i < argc; i++)
        [args addObject:processInfo.arguments[i]];
    _arguments = [args copy];

    free(argv);

    return self;
}

- (void)printHelp:(BOOL)shouldExit
{
    printf("usage: %s [file ...]\n\nOptions:\n", kMPCommandName.UTF8String);
    printf("  -h, --help       Print this help message and exit.\n");
    printf("  -v, --version    Print the version and exit.\n");
    if (shouldExit)
        exit(EXIT_SUCCESS);
}

- (void)printVersion:(BOOL)shouldExit
{
    printf("%s %s (%s)\n", kMPApplicationName.UTF8String,
           kMPApplicationShortVersion, kMPApplicationBundleVersion);
    if (shouldExit)
        exit(EXIT_SUCCESS);
}

@end
