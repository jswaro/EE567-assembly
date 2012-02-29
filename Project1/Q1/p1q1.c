
//
//	Template for Project 1, Problem 1
//
//      The concept behind my solution is to store the sum of
//        the first 8 numbers as a rolling sum and only subtract
//        x[n-7] from each sum and add x[n+1] to the next sum in
//        order to minimize the number of times we go back into
//        memory to search for values. See p1q1.asm
//
//	EE467/567 - Winter 2012

#include <stdio.h>

void filter(char *, short *);

int main()
{
	// Local variables
    char    x[100] =        { 12, -8, 18, -6, 30, -14, 28, 15, 18, 37,
			        32, 56, 42, 63, 42, 53, 60, 74, 68, 55,
				39, 51, 68, 47, 68, 81, 67, 65, 69, 81,
				83, 42, 60, 64, 49, 90, 62, 31, 55, 50,
				48, 5, 53, -1, 39, 0, 20, 25, 19, 2,
				-17, -8, -23, -41, -33, -13, -17, -36, -32, -29,
				-37, -39, -13, -85, -46, -49, -45, -67, -45, -58,
				-49, -48, -43, -65, -43, -61, -87, -66, -71, -89,
				-67, -69, -45, -49, -39, -46, -50, -46, -37, -20,
				-22, -53, -26, -28, -11, -21, 6, -11, -28, 22 };

	short	y[100] = { 0 };
	int	ii, jj;

	// Insert your functionality here

	filter(x, y);

	// Print selected results to the screen
	printf("\nx[0 ... 19] = ");
        for(ii=0;ii<20;ii++) printf("%d ", x[ii]);
	printf("\n");

	printf("\ny[0 ... 19] = ");
        for(ii=0;ii<20;ii++) printf("%d ", y[ii]);
	printf("\n");
	return 0;
}
