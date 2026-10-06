#include <stdio.h>
#include <unistd.h>
#include "extra.h"
#include "encode.h"

#ifdef JPEG_ENCODE
#undef INT16
#undef INT32
#include <jpeglib.h>
#endif

static void
ImagingDestroyBlock(Imaging im)
{
    if (im->block) {
        free(im->block);
    }
}

Imaging imageFromRGBA(int width, int height, uint8_t* data)
{
	Imaging im = ImagingNewPrologue("RGBA", width, height);
	im->block = data;
	im->destroy = ImagingDestroyBlock;
	for (int i = 0; i < im->ysize; i++) {
		im->image[i] = data;
		data += im->linesize;
	}
	if (im->pixelsize & 3) {
		im->image8 = (uint8_t **)im->image;
	} else {
		im->image32 = (int32_t **)im->image;
	}
	return im;
}

const char* imageMode(Imaging im)
{
	return im->mode;
}

int imageWidth(Imaging im)
{
	return im->xsize;
}

int imageHeight(Imaging im)
{
	return im->ysize;
}

int imageLinesize(Imaging im)
{
	return im->linesize;
}

uint8_t* imageBlock(Imaging im)
{
	return im->block;
}

const char* blurHashForImage(Imaging im, int xComponents, int yComponents)
{
	return blurHashForPixels(xComponents, yComponents, im->xsize, im->ysize, im->block, im->linesize);
}

#ifdef JPEG_ENCODE
void jpegEncode(Imaging im, int quality, uint8_t** data, size_t* size)
{
	struct jpeg_compress_struct cinfo = {0};
	struct jpeg_error_mgr jerr;
	cinfo.err = jpeg_std_error(&jerr);
	jpeg_create_compress(&cinfo);
	jpeg_mem_dest(&cinfo, data, size);
	cinfo.image_width = im->xsize;
	cinfo.image_height = im->ysize;
	cinfo.input_components = 4;
	cinfo.in_color_space = JCS_EXT_RGBX;
	jpeg_set_defaults(&cinfo);
	jpeg_set_quality(&cinfo, quality, TRUE);
	jpeg_start_compress(&cinfo, TRUE);
	jpeg_write_scanlines(&cinfo, im->image, im->ysize);
	jpeg_finish_compress(&cinfo);
	jpeg_destroy_compress(&cinfo);
}
#endif
