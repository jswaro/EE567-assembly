
//
//	Template for Project 1, Problem 2
//
//      The concept behind my solution is to store the sum of
//        the first 8 numbers as a rolling sum and only subtract
//        x[n-7] from each sum and add x[n+1] to the next sum in
//        order to minimize the number of times we go back into
//        memory to search for values. See p1q2.asm
//
//	EE467/567 - Winter 2012

//#include "stdafx.h"
//#include <conio.h>
#include <stdio.h>

void filterFloat(float *, float *);


  int main()
{
	// Local variables
    float	x[100] = 	{ 	0.1102, 0.2048, -0.0468, 0.3977, -0.3082, 0.5864, 0.3713, 0.0262, 0.1790, 0.5925,
				0.6481, 0.3913, 0.5768, 1.0845, 0.6607, 0.8228, 1.0494, 1.1057, 0.9441, 0.5294,
				0.5433, 1.0790, 0.8005, 1.1351, 0.6528, 1.1149, 1.1542, 1.0848, 0.7255, 0.8770,
				1.0555, 0.5248, 0.7206, 0.5966, 1.0831, 1.2281, 0.9330, 0.5257, 0.7240, 0.5623,
				0.3537, 0.6001, 0.4857, 0.1177, 0.1712, 0.2123, 0.3840, -0.1541, -0.0543, -0.0887,
				0.2141, 0.3455, 0.1988, 0.0076, -0.2000, -0.3246, -0.7759, -0.5628, -0.5189, -0.5100,
				-0.8702, -0.8329, -0.5731, -1.0529, -0.9896, -0.7648, -0.4823, -1.1591, -0.7660, -1.1444,
				-1.0422, -1.1294, -0.6751, -0.7822, -1.5262, -1.0891, -0.8554, -1.3739, -1.0235, -1.0613,
				-0.8107, -1.1274, -0.8615, -0.9801, -1.1680, -0.8722, -0.8491, -0.7629, -0.7181, -0.9901,
				-0.2671, -0.1552, -0.4614, -0.5560, -0.2586, -0.3513, -0.1730, -0.5661, 0.3583, 0.0818 };

	float	y[100] = { 0 };
	int	ii, jj;

	// Insert your functionality here

	filterFloat(x,y);

	// Print selected results to the screen
	printf("\nx[0 ... 19] = ");
        for(ii=0;ii<20;ii++) printf("%f ", x[ii]);
	printf("\n");

	printf("\ny[0 ... 19] = ");
        for(ii=0;ii<20;ii++) printf("%f ", y[ii]);
	printf("\n");

	return 0;
}

