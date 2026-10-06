#include "Imaging.h"
#include "imaging_export.h"

IMAGING_EXPORT Imaging imageFromRGBA(int width, int height, uint8_t* data);
IMAGING_EXPORT const char* imageMode(Imaging im);
IMAGING_EXPORT int imageWidth(Imaging im);
IMAGING_EXPORT int imageHeight(Imaging im);
IMAGING_EXPORT int imageLinesize(Imaging im);
IMAGING_EXPORT uint8_t* imageBlock(Imaging im);
IMAGING_EXPORT const char* blurHashForImage(Imaging im, int xComponents, int yComponents);

#ifdef JPEG_ENCODE
IMAGING_EXPORT void jpegEncode(Imaging im, int quality, uint8_t** data, size_t* size);
#endif
