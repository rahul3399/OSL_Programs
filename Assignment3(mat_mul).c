
#include<stdio.h>
#include<semaphore.h>
#include<pthread.h>
int r1,r2,c1,c2,m1[5][5],m2[5][5],m3[5][5],i,j,k;
void *threadcalc(void *args)
{
	for(k=0; k<c1; k++)
	{
		m3[i][j] += m1[i][k]*m2[k][j];
	}
}
void *matmul(void *args)
{
	pthread_t tid;
	for(i=0; i<r1; i++)
	{
		for(j=0; j<c2; j++)
		{
			pthread_create(&tid,NULL,threadcalc,NULL);
			pthread_join(tid,NULL);
		}
	}
	
	printf("\nMultiplication of the two matrices is :\n");
	for(i=0; i<r1; i++)
	{
		for(j=0; j<c1; j++)
		{
			printf("%d\t",m3[i][j]);
		}
		printf("\n");
	}
}
void main()
{
	pthread_t thread;
	do
	{
		printf("\nEnter row and column size of matrix 1:");
		scanf("%d%d",&r1,&c1);
		printf("\nEnter row and column size of matrix 2:");
		scanf("%d%d",&r2,&c2);

		if(r1 != r2 || c1 != c2)
		{
			printf("\nValues improper for matrix multiplication");
		}
	}while(r1 != r2 || c1 != c2);
	printf("\nEnter values of matrix 1:\n");
	for(i=0; i<r1; i++)
	{
		for(j=0; j<c1; j++)
		{
			scanf("%d",&m1[i][j]);
		}
	}
	printf("\nEnter values of matrix 2:\n");
	for(i=0; i<r2; i++)
	{
		for(j=0; j<c2; j++)
		{
			scanf("%d",&m2[i][j]);
		}
	}
	pthread_create(&thread,NULL,matmul,NULL);
	pthread_join(thread,NULL);
}
