//
//  cmark_gfm_rendering.h
//  MacDown
//
//  cmark-gfm rendering utilities for MacDown.
//

#ifndef MacDown_cmark_gfm_rendering_h
#define MacDown_cmark_gfm_rendering_h

#import <Foundation/Foundation.h>

// Code block accessory flags (replaces HOEDOWN_HTML_* flags).
typedef NS_OPTIONS(NSUInteger, MPCmarkRenderFlags) {
    MPCmarkRenderFlagNone             = 0,
    MPCmarkRenderFlagLineNumbers      = (1 << 0),
    MPCmarkRenderFlagBlockInformation = (1 << 1),
};

// Callback for language alias resolution + Prism dependency tracking.
typedef NSString * _Nullable (^MPLanguageCallback)(NSString * _Nonnull lang);

// Render markdown to HTML using cmark-gfm.
//
// extensions: array of extension name strings to enable
//             (e.g. @[@"table", @"strikethrough", @"autolink",
//              @"tasklist", @"footnotes", @"tagfilter"])
// options:    CMARK_OPT_* flags (CMARK_OPT_SMART, CMARK_OPT_HARDBREAKS, etc.)
// renderFlags: MPCmarkRenderFlags for code block customization
// languageCallback: called for each fenced code block language;
//                   return mapped language name or nil
// outLanguages: populated with encountered language names (for Prism)
NSString * _Nonnull MPCmarkGFMToHTML(
    NSString * _Nonnull markdown,
    NSArray<NSString *> * _Nonnull extensions,
    int options,
    MPCmarkRenderFlags renderFlags,
    MPLanguageCallback _Nullable languageCallback,
    NSMutableArray<NSString *> * _Nullable outLanguages);

// Generate a TOC from markdown using cmark-gfm AST iteration.
NSString * _Nonnull MPCmarkGFMGenerateTOC(
    NSString * _Nonnull markdown,
    NSArray<NSString *> * _Nonnull extensions,
    int options,
    int maxLevel);

#endif
