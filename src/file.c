#include "file.h"


void _b_setup_foffsets(b_file* _file, const uint32_t _len);


inline void _b_setup_foffsets(b_file* _file, const uint32_t _len) {
    if(!_file || !_len) return;

    // todo: #2 handle file stems that begin with '.'
    _file->stem = (_file->stem && _file->stem < _len)?
        _file->stem + 1 : _file->stem;
    _file->stem = (_file->stem == _len - 1)? 0 : _file->stem;
    _file->ext = (_file->ext && _file->ext < _len)?
        _file->ext + 1 : _file->ext;
    _file->ext = (_file->ext== _len - 1)? 0 : _file->ext;
}

b_file b_new_file(const char* _path) {
    b_file file = {0, 0};
    if(!_path) return file;

    uint32_t i = 0;

    do {
        switch(_path[i]) {
            case '/':
                file.stem = i;
                file.ext = 0;
                break;
            case '.':
                file.ext = i;
                break;
        }
    } while(_path[i++]);

    _b_setup_foffsets(&file, i);
    return file;
}
