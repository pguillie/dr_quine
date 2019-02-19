/*
	This program will print its own source when run.
*/

#include <stdio.h>

void print_source(const char *s)
{
	printf(s, s, 10, 9, 34);
}

int main(void)
{
/*
	Comment.
*/
	const char *s = "/*%2$c%3$cThis program will print its own source when run.%2$c*/%2$c%2$c#include <stdio.h>%2$c%2$cvoid print_source(const char *s)%2$c{%2$c%3$cprintf(s, s, 10, 9, 34);%2$c}%2$c%2$cint main(void)%2$c{%2$c/*%2$c%3$cComment.%2$c*/%2$c%3$cconst char *s = %4$c%1$s%4$c;%2$c%3$cprint_source(s);%2$c%3$creturn (0);%2$c}%2$c";
	print_source(s);
	return (0);
}
