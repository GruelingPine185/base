#include "token.h"


inline int b_is_letter(const char _c) {
    return (b_is_upcase(_c) || b_is_locase(_c));
}

inline int b_is_upcase(const char _c) {
    return (_c >= 'A' && _c <= 'Z');
}

inline int b_is_locase(const char _c) {
    return (_c >= 'a' && _c <= 'z');
}

inline int b_is_digit(const char _c) {
    return (_c >= '0' && _c <= '9');
}
