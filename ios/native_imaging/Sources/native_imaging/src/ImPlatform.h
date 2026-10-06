/*
 * The Python Imaging Library
 * $Id$
 *
 * platform declarations for the imaging core library
 *
 * Copyright (c) Fredrik Lundh 1995-2003.
 */

#include <stddef.h>
#include <stdint.h>
#include <sys/types.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>

#define Py_ssize_t ssize_t
#define Py_size_t size_t
#define PyObject void

/* Workaround issue #2479 */
#if PY_VERSION_HEX < 0x03070000 && defined(PySlice_GetIndicesEx) && !defined(PYPY_VERSION)
#undef PySlice_GetIndicesEx
#endif

#if defined(PIL_NO_INLINE)
#define inline
#else
#if defined(_MSC_VER) && !defined(__GNUC__)
#define inline __inline
#endif
#endif

#ifdef _WIN32

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>

#else
/* For System that are not Windows, we'll need to define these. */

#define INT16 int16_t
#define INT32 int32_t
#define UINT16 uint16_t
#define UINT32 uint32_t
#define INT64 int64_t
#define INT8 int8_t
#define UINT8 uint8_t

#endif

/* assume IEEE; tweak if necessary (patches are welcome) */
#define FLOAT16 UINT16
#define FLOAT32 float
#define FLOAT64 double

#ifdef _MSC_VER
typedef signed __int64       int64_t;
#endif

#ifdef __GNUC__
    #define GCC_VERSION (__GNUC__ * 10000 \
                       + __GNUC_MINOR__ * 100 \
                       + __GNUC_PATCHLEVEL__)
#endif

