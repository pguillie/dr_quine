/*
	This program will print its own source when run.
*/

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#define FT(x) int main(void) { int fd = open("Grace_kid.c", O_WRONLY | O_TRUNC | O_CREAT, 0644); if (fd < 0) return (1); PRINT_SOURCE(fd, x); close(fd); return (0); }
#define PRINT_SOURCE(fd, s) dprintf(fd, s, s, 10, 9, 34)
#define SOURCE "/*%2$c%3$cThis program will print its own source when run.%2$c*/%2$c%2$c#include <stdio.h>%2$c#include <unistd.h>%2$c#include <fcntl.h>%2$c%2$c#define FT(x) int main(void) { int fd = open(%4$cGrace_kid.c%4$c, O_WRONLY | O_TRUNC | O_CREAT, 0644); if (fd < 0) return (1); PRINT_SOURCE(fd, x); close(fd); return (0); }%2$c#define PRINT_SOURCE(fd, s) dprintf(fd, s, s, 10, 9, 34)%2$c#define SOURCE %4$c%1$s%4$c%2$c%2$cFT(SOURCE)%2$c"

FT(SOURCE)
