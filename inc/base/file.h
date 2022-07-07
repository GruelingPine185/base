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
const char* b_get_fname(const b_file* _file, const char* _path);
const char* b_get_fext(const b_file* _file, const char* _path);
char* b_get_fstem(const b_file* _file, const char* _path);
EXT_END

#endif // BASE_FILE_H
