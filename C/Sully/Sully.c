#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#define STR(n) #n
#define FILE(x) "Sully_" STR(x) ".c"
#define EXE(x) "Sully_" STR(x)
#define PRINT_SOURCE(fd, s, i) dprintf(fd, s, s, 10, 9, 34, i)
#define SOURCE "#include <stdlib.h>%2$c#include <stdio.h>%2$c#include <unistd.h>%2$c#include <fcntl.h>%2$c%2$c#define STR(n) #n%2$c#define FILE(x) %4$cSully_%4$c STR(x) %4$c.c%4$c%2$c#define EXE(x) %4$cSully_%4$c STR(x)%2$c#define PRINT_SOURCE(fd, s, i) dprintf(fd, s, s, 10, 9, 34, i)%2$c#define SOURCE %4$c%1$s%4$c%2$c%2$c#define i %5$d%2$c%2$cint main(void)%2$c{%2$c%3$cint fd = open(FILE(i), O_WRONLY | O_TRUNC | O_CREAT, 0644);%2$c%3$cif (fd < 0)%2$c%3$c%3$creturn (1);%2$c%3$cPRINT_SOURCE(fd, SOURCE, i - 1);%2$c%3$cclose(fd);%2$c%3$cif (system(%4$c/usr/bin/gcc %4$c FILE(i) %4$c -o %4$c EXE(i)))%2$c%3$c%3$creturn (1);%2$c%3$cif (i > 0)%2$c%3$c%3$creturn (system(%4$c./%4$c EXE(i)));%2$c%3$creturn (0);%2$c}%2$c"

#define i 5

int main(void)
{
	int fd = open(FILE(i), O_WRONLY | O_TRUNC | O_CREAT, 0644);
	if (fd < 0)
		return (1);
	PRINT_SOURCE(fd, SOURCE, i - 1);
	close(fd);
	if (system("/usr/bin/gcc " FILE(i) " -o " EXE(i)))
		return (1);
	if (i > 0)
		return (system("./" EXE(i)));
	return (0);
}
