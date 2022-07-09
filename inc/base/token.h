#ifndef BASE_TOKEN_H
#define BASE_TOKEN_H


#include "config.h"


EXT_BEGIN
int b_is_letter(const char _c);
int b_is_upcase(const char _c);
int b_is_locase(const char _c);
int b_is_digit(const char _c);
int b_is_whitespace(const char _c);
EXT_END

#endif // BASE_TOKEN_H
