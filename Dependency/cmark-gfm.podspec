Pod::Spec.new do |s|
  s.name         = "cmark-gfm"
  s.version      = "0.29.0.13"
  s.summary      = "GitHub's CommonMark parser with GFM extensions"

  s.description  = <<-DESC
    GitHub's fork of cmark, an efficient CommonMark parser
    in C with GitHub Flavored Markdown extensions.
  DESC

  s.homepage     = "https://github.com/github/cmark-gfm"
  s.license      = { :type => "BSD-2-Clause" }
  s.author       = "GitHub"
  s.osx.deployment_target = "11.0"

  s.source       = {
    :git => "https://github.com/github/cmark-gfm.git",
    :tag => "0.29.0.gfm.13"
  }

  s.source_files = [
    "cmark-gfm/src/**/*.{c,h}",
    "cmark-gfm/extensions/**/*.{c,h}",
    "cmark-gfm-pod/cmark-gfm-config/*.h",
  ]

  s.exclude_files = "cmark-gfm/src/main.c"

  s.public_header_files = [
    "cmark-gfm/src/cmark-gfm.h",
    "cmark-gfm/src/cmark-gfm-extension_api.h",
    "cmark-gfm/extensions/cmark-gfm-core-extensions.h",
    "cmark-gfm-pod/cmark-gfm-config/cmark-gfm_export.h",
    "cmark-gfm-pod/cmark-gfm-config/cmark-gfm-extensions_export.h",
    "cmark-gfm-pod/cmark-gfm-config/cmark-gfm_version.h",
  ]

  s.header_dir = "cmark-gfm"

  s.pod_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => [
      "$(PODS_TARGET_SRCROOT)/cmark-gfm-pod/cmark-gfm-config",
      "$(PODS_TARGET_SRCROOT)/cmark-gfm/src",
      "$(PODS_TARGET_SRCROOT)/cmark-gfm/extensions",
    ].join(" "),
    "GCC_PREPROCESSOR_DEFINITIONS" =>
      "CMARK_GFM_STATIC_DEFINE=1 " \
      "CMARK_GFM_EXTENSIONS_STATIC_DEFINE=1",
  }
end
