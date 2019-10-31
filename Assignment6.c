#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
pthread_t philosopher[5];
sem_t p[5];
sem_t room;
void *func(int i)
{
	sem_wait(&room);
	printf("\nPhilosopher %d has entered the room",i+1);
	printf("\nPhilosopher %d is thinking",i+1);
	sem_wait(&p[i]);
	sem_wait(&p[(i+1)%5]);
	printf("\nPhilosopher %d is eating",i+1);
	sleep(1);
	sem_post(&p[(i+1)%5]);
	sem_post(&p[i]);
	sem_post(&room);
	printf("\nPhilosopher %d has finished eating and left the room\n",i+1);
	return NULL;
}

int main()
{
	int i;
	for(i=0;i<5;i++)
	{
		sem_init(&p[i],0,1);
	}
	sem_init(&room,0,4);

	for(i=0;i<5;i++)
	{
		pthread_create(&philosopher[i],NULL,(void *)func,(void *)i);
	}

	for(i=0;i<5;i++)
	{
		pthread_join(philosopher[i],NULL);
	}

	for(i=0;i<5;i++)
	{
		sem_destroy(&p[i]);

	}
	sem_destroy(&room);
	printf("\n");
}
