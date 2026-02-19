cmake_minimum_required(VERSION 3.6)
project(Imaging)
include(CMakeDependentOption)

if(POLICY CMP0069)
  cmake_policy(SET CMP0069 NEW)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT IPOSupport)
endif()

option(JPEG_ENCODE "enables the jpegEncode function" ON)
if(JPEG_ENCODE)
  add_definitions(-DJPEG_ENCODE)
endif()

cmake_dependent_option(SYSTEM_LIBJPEG "use system libjpeg" OFF JPEG_ENCODE OFF)

add_definitions(-DBMP_SUPPORTED -DPPM_SUPPORTED)
add_library(Imaging SHARED Blend.c BoxBlur.c Copy.c Except.c extra.c Geometry.c Palette.c Resample.c Storage.c blurhash/encode.c)

target_link_options(Imaging PRIVATE
    "-Wl,-z,max-page-size=16384"
)

target_include_directories(Imaging PRIVATE blurhash)
target_link_libraries(Imaging m)

if(SYSTEM_LIBJPEG)
  if(${CMAKE_VERSION} VERSION_LESS "3.12")
    message(FATAL_ERROR "SYSTEM_LIBJPEG requires CMake >= 3.12")
  endif()
  find_package(JPEG REQUIRED)
  target_link_libraries(Imaging JPEG::JPEG)
elseif(JPEG_ENCODE)
  target_sources(Imaging PRIVATE libjpeg-turbo/cdjpeg.c libjpeg-turbo/jaricom.c libjpeg-turbo/jcapimin.c libjpeg-turbo/jcapistd.c libjpeg-turbo/jcarith.c libjpeg-turbo/jccoefct.c libjpeg-turbo/jccolor.c libjpeg-turbo/jcdctmgr.c libjpeg-turbo/jchuff.c libjpeg-turbo/jcicc.c libjpeg-turbo/jcinit.c libjpeg-turbo/jcmainct.c libjpeg-turbo/jcmarker.c libjpeg-turbo/jcmaster.c libjpeg-turbo/jcomapi.c libjpeg-turbo/jcparam.c libjpeg-turbo/jcphuff.c libjpeg-turbo/jcprepct.c libjpeg-turbo/jcsample.c libjpeg-turbo/jctrans.c libjpeg-turbo/jdapimin.c libjpeg-turbo/jdapistd.c libjpeg-turbo/jdarith.c libjpeg-turbo/jdatadst.c libjpeg-turbo/jdatadst-tj.c libjpeg-turbo/jdatasrc.c libjpeg-turbo/jdatasrc-tj.c libjpeg-turbo/jdcoefct.c libjpeg-turbo/jdcolor.c libjpeg-turbo/jddctmgr.c libjpeg-turbo/jdhuff.c libjpeg-turbo/jdicc.c libjpeg-turbo/jdinput.c libjpeg-turbo/jdmainct.c libjpeg-turbo/jdmarker.c libjpeg-turbo/jdmaster.c libjpeg-turbo/jdmerge.c libjpeg-turbo/jdphuff.c libjpeg-turbo/jdpostct.c libjpeg-turbo/jdsample.c libjpeg-turbo/jdtrans.c libjpeg-turbo/jerror.c libjpeg-turbo/jfdctflt.c libjpeg-turbo/jfdctfst.c libjpeg-turbo/jfdctint.c libjpeg-turbo/jidctflt.c libjpeg-turbo/jidctfst.c libjpeg-turbo/jidctint.c libjpeg-turbo/jidctred.c libjpeg-turbo/jmemmgr.c libjpeg-turbo/jmemnobs.c libjpeg-turbo/jquant1.c libjpeg-turbo/jquant2.c libjpeg-turbo/jsimd_none.c libjpeg-turbo/jutils.c libjpeg-turbo/rdbmp.c libjpeg-turbo/rdcolmap.c libjpeg-turbo/rdppm.c libjpeg-turbo/rdswitch.c libjpeg-turbo/tjutil.c libjpeg-turbo/transupp.c libjpeg-turbo/turbojpeg.c libjpeg-turbo/wrbmp.c libjpeg-turbo/wrppm.c)
  target_include_directories(Imaging PRIVATE libjpeg-turbo ${CMAKE_CURRENT_BINARY_DIR}/libjpeg-turbo)
endif()

include(GenerateExportHeader)
generate_export_header(Imaging)
target_include_directories(Imaging PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>)
set_target_properties(Imaging PROPERTIES C_VISIBILITY_PRESET hidden)

if(IPOSupport)
  set_target_properties(Imaging PROPERTIES INTERPROCEDURAL_OPTIMIZATION True)

  # https://reviews.llvm.org/D79919
  if (CMAKE_C_COMPILER_ID STREQUAL "Clang")
    set_target_properties(Imaging PROPERTIES LINK_FLAGS "-O3")
  endif()
endif()
