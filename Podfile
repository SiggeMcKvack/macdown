platform :osx, "11.0"

source 'https://github.com/MacDownApp/cocoapods-specs.git'  # Patched libraries.
source 'https://cdn.cocoapods.org/'

project 'MacDown.xcodeproj'

inhibit_all_warnings!

target "MacDown" do
  pod 'handlebars-objc', '~> 1.4'
  pod 'cmark-gfm', :path => 'Dependency'
  pod 'JJPluralForm', '~> 2.1'
  pod 'LibYAML', '~> 0.1'
  pod 'M13OrderedDictionary', '~> 1.1'
  pod 'MASPreferences', '~> 1.4'
  pod 'Sparkle', '~> 2.0', :inhibit_warnings => false

  pod 'PAPreferences'
end

target "MacDownTests" do
  pod 'PAPreferences'
end

target "macdown-cmd" do
end
