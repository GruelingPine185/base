#include "inc/base/file.h"

#include <stdio.h>


const char* paths[] = {
        "./stem.ext",
        "filename",
        "stem.ext",
        "/dir/",
        "./.ext",  
        ".stem.test.ext",
        ".",
        "/"
    };

int main(void) {
    for(int i = 0; i < (int) (sizeof(paths) / sizeof(*paths)); i++) {
        b_file file = b_new_file(paths[i]);
        printf("%s\n%u\n%u\n\n", paths[i], file.stem, file.ext);
    }

    return 0;
}
