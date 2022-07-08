#ifndef BASE_CONFIG_H
#define BASE_CONFIG_H


#ifdef __cplusplus
    #define EXT_BEGIN   extern "C" {
    #define EXT_END     }
#else
    #define EXT_BEGIN
    #define EXT_END
#endif // __cplusplus

#endif // BASE_CONFIG_H
