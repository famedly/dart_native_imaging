#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint native_imaging.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'native_imaging'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  sources_root = 'native_imaging/Sources/native_imaging'
  libjpeg_turbo_sources = %w[
    cdjpeg jaricom jcapimin jcapistd jcarith jccoefct jccolor jcdctmgr jchuff jcicc
    jcinit jcmainct jcmarker jcmaster jcomapi jcparam jcphuff jcprepct jcsample
    jctrans jdapimin jdapistd jdarith jdatadst jdatadst-tj jdatasrc jdatasrc-tj
    jdcoefct jdcolor jddctmgr jdhuff jdicc jdinput jdmainct jdmarker jdmaster
    jdmerge jdphuff jdpostct jdsample jdtrans jerror jfdctflt jfdctfst jfdctint
    jidctflt jidctfst jidctint jidctred jmemmgr jmemnobs jquant1 jquant2 jsimd_none
    jutils rdbmp rdcolmap rdppm rdswitch tjutil transupp turbojpeg wrbmp wrppm
  ].map { |f| "#{sources_root}/src/libjpeg-turbo/#{f}.c" }
  s.source_files = ["#{sources_root}/Classes/**/*", "#{sources_root}/src/*.{h,c}", "#{sources_root}/src/ios/*.{h,c}", "#{sources_root}/src/blurhash/*.{h,c}"] + libjpeg_turbo_sources
  s.dependency 'Flutter'
  s.platform = :ios, '15.0'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => "#{File.join(File.dirname(__FILE__), sources_root, 'src/blurhash')} #{File.join(File.dirname(__FILE__), sources_root, 'src/libjpeg-turbo')}" }
  s.compiler_flags = '-DJPEG_ENCODE', '-DBMP_SUPPORTED', '-DPPM_SUPPORTED'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
