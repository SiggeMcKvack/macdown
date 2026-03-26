// Export macros for cmark-gfm extensions (static build).
#ifndef CMARK_GFM_EXTENSIONS_EXPORT_H
#define CMARK_GFM_EXTENSIONS_EXPORT_H

#define CMARK_GFM_EXTENSIONS_EXPORT \
    __attribute__((visibility("default")))
#define CMARK_GFM_EXTENSIONS_NO_EXPORT

#endif
