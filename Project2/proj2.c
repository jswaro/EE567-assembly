/* ------------------------------------------------------------
 	
	Project 2 - Template

----------------------------------------------------------- */

#include <stdio.h>
#include <stdlib.h>

//Uncomment this line if compiling on windows.
//#include <conio.h>
//#define WINDOWS


void calculateHCValues(float *x, float *y, float *z, float *h, float *c);

int main( void )
{
	// Local variables
  	int 	ii;
	FILE	*in;
	float	x[1024], y[1024], z[1024];
	float	Hvalues[6] = {0.0};
	float	Cvalues[3] = {0.0};	
	float   csum[3]= {0, 0, 0};
	float   hprod[6]= {0, 0, 0, 0, 0, 0};


	//
	// Retrieve the variables from the input file
	//
	if ( (in = fopen("data.dat","r")) == NULL )
	{
		printf("Could not open file with x, y, and z vectors \n");
		exit(0);
	}

	ii = 0;
	while( (!feof(in)) && (ii < 1024) )
	{
		fscanf(in, "%f %f %f", &x[ii], &y[ii], &z[ii]);
		ii++;
	}

	// Close the input file
	fclose(in);

	// ------------------------------------------------------
	//	Insert your inline assembly code here to calculate
	//	the Hvalues and Cvalues
	// ------------------------------------------------------
        calculateHCValues(x,y,z,Hvalues,Cvalues);

	// ------------------------------------------------------
	//	To follow are the calculation of the values using C
	// ------------------------------------------------------
	for(ii=0;ii<1024;ii++) csum[0] = csum[0] + x[ii];
	for(ii=0;ii<1024;ii++) csum[1] = csum[1] + y[ii];
	for(ii=0;ii<1024;ii++) csum[2] = csum[2] + z[ii];
	
	//calculate h values
	for(ii=0;ii<1024;ii++) hprod[0] = hprod[0] + x[ii]*x[ii];
	for(ii=0;ii<1024;ii++) hprod[1] = hprod[1] + x[ii]*y[ii];
	for(ii=0;ii<1024;ii++) hprod[2] = hprod[2] + x[ii]*z[ii];
	for(ii=0;ii<1024;ii++) hprod[3] = hprod[3] + y[ii]*y[ii];
	for(ii=0;ii<1024;ii++) hprod[4] = hprod[4] + y[ii]*z[ii];
	for(ii=0;ii<1024;ii++) hprod[5] = hprod[5] + z[ii]*z[ii];
	
	
	//print all results
	printf("\nHvalues from C:\n");
	for(ii=0;ii<6;ii++) printf("%f\n", hprod[ii]);
	printf("\nHvalues from the Inline Assembly:\n");
	for(ii=0;ii<6;ii++) printf("%f\n", Hvalues[ii]);
	printf("\nCvalues from C:\n");
	for(ii=0;ii<3;ii++) printf("%f\n", csum[ii]);	
	printf("\nCvalues from the Inline Assembly:\n");
	for(ii=0;ii<3;ii++) printf("%f\n", Cvalues[ii]);

#ifdef WINDOWS
        getch();
#endif

	return 0;
}


