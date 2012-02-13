
//
//	Template for Project 1, Problem 3
//
//	INSERT THE DESCRIPTION OF YOUR SOLUTION HERE!
//
//
//
//
//
//
//	EE467/567 - Winter 2012

//#include "stdafx.h"
#include <conio.h>
#include <stdio.h>

void function1(char *, short *);


  int main()
{
	// Local variables
    short   x[100] =        { 1, 0, 0, 0, 0, -38, 24, -25, 6, -44,
				26, -15, 46, 45, 12, 0, 51, 41, 19, 41,
				21, -20, -26, -20, 5, 29, -24, 43, 9, -16,
				26, 6, -7, 25, 16, 38, 59, 3, 49, -41,
                61, -29, -31, 48, 31, -46, -62, 51, -38, -25,
				21, -27, -3, -55, 63, 11, -9, 2, -21, -8,
				-34, 11, 34, 4, 18, -36, -15, 36, 23, -4,
                9, 38, -55, 14, -57, -10, -24, 48, -61, 35,
				60, 63, 37, -7, 0, -36, 19, -22, 59, 29,
				-11, 32, -29, -7, 56, 24, -36, 44, 17, -46 };
	short	N[100];
    short   P[100];
    short   Z=0;

	int	ii, jj;

	// Insert your functionality here

	_asm
	{

	}

	// Print selected results to the screen
	printf("\nx[0 ... 19] = ");
        for(ii=0;ii<20;ii++) printf("%d ", x[ii]);
	printf("\n");

	printf("\ny[0 ... 19] = ");
        for(ii=0;ii<20;ii++) printf("%d ", y[ii]);
	printf("\n");
}
