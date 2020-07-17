#include <stdio.h>
#include <stdlib.h>
#define _CRT_SECURE_NO_WARNINGS
void main()
{
int i,j,x_sz,y_sz;
double max_val;
double min_val;
unsigned char *idatap,*odatap;
FILE *ifp,*ofp;
x_sz=512;
y_sz=512;

max_val=0; 
min_val=255; 
idatap = (unsigned char *)calloc(x_sz*y_sz ,sizeof(unsigned char));
odatap = (unsigned char *)calloc(x_sz*y_sz ,sizeof(unsigned char));
ifp = fopen("lena_512_low.raw","rb");
fread(idatap,sizeof(unsigned char),x_sz*y_sz,ifp);
fclose(ifp);

for(i=0;i<x_sz;i++)
 {for(j=0;j<y_sz;j++)
	{
	if(*(idatap+i*y_sz+j)>max_val)
		max_val=*(idatap+i*y_sz+j);
	}
		}


for(i=0;i<x_sz;i++)
 {for(j=0;j<y_sz;j++)
	{
	if(*(idatap+i*y_sz+j)<min_val)
		min_val=*(idatap+i*y_sz+j);
	}
		}
//구한 max_val와 min_val를 이용해서 contrast stretching을 계산함 
for(i=0;i<x_sz;i++)
 {for(j=0;j<y_sz;j++)
  *(odatap+i*y_sz+j)=(unsigned char)(255.0*((double)((double)*(idatap+i*y_sz+j)-(double)(min_val))/(double)((double)max_val-(double)min_val)));
}

ofp = fopen("outimg2.raw","wb");
fwrite(odatap,sizeof(unsigned char),x_sz*y_sz,ofp);
fclose(ofp);

}