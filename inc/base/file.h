#ifndef BASE_FILE_H
#define BASE_FILE_H


#include <stdint.h>

#include "config.h"


typedef struct b_file b_file;


struct b_file {
    uint32_t stem;
    uint32_t ext;
};


EXT_BEGIN
b_file b_new_file(const char* _path);
EXT_END

#endif // BASE_FILE_H
