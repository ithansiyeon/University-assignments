#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>
#define MAX_STACK_SIZE 100
#define FALSE 0 
#define TRUE 1
int row;
int col;
typedef struct {
	short int vert;
    short int horiz;
} offsets;
offsets move[8];
typedef struct  {
             short int e_row;
             short int e_col;
             short int dir;
}element;

element stack[MAX_STACK_SIZE];
int maze[MAX_STACK_SIZE][MAX_STACK_SIZE];


void push(element item,int * top)
{   if (* top >= MAX_STACK_SIZE-1)
      printf("Stack is Full\n");
     stack[++*top] = item;
}

element pop(int *top)
{ if(*top == -1) printf("stack is empty.\n");
 return stack[(*top)--];
}

void path(int(*maze)[MAX_STACK_SIZE])
{  int i,j,top,next_row,next_col,mark[MAX_STACK_SIZE][MAX_STACK_SIZE],p_row,p_col,dir=1,found=FALSE;
 element position;
 int EXIT_ROW=row;
 int EXIT_COL=col;
 for(i=0;i<row+2;i++)
  { for(j=0;j<col+2;j++)
   {mark[i][j]=0;
    }
 }

 mark[1][1]=1; top=0;
 stack[0].e_row=1; stack[0].e_col=1; stack[0].dir=1;
 while(top>-1 && !found)
 {
  position=pop(&top);
  p_row=position.e_row; p_col=position.e_col; dir=position.dir;

 while(dir<8 && !found)
 {
  next_row=p_row+move[dir-1].vert;
  next_col=p_col+move[dir-1].horiz;

  if(next_row==EXIT_ROW && next_col==EXIT_COL)
  found=TRUE;
  else if(!maze[next_row][next_col] && !mark[next_row][next_col])
  {
   mark[next_row][next_col]=1;
   position.e_row=p_row; position.e_col=p_col; position.dir=++dir;
   push(position,&top);
   p_row=next_row; p_col=next_col; dir=0;
  }
  else ++dir;
 }
}
 if (found){ 
    printf("\n** The maze dose have a path **\n"); 
 printf("(%d, %d)",row, col); 
 printf("<-(%d, %d)", p_row, p_col);
 for(i=top; i>=0; i--) { 
   printf("<-(%d, %d)",stack[i].e_row,stack[i].e_col); 
 } 
  printf("\n\n");
 }
 else printf("\n The maze does not have path\n");
 
}


int main() {
int i,j;
int N=100;
//FILE * maze_fp; 
int maze[100][100];
FILE * maze_fp=NULL;
maze_fp=fopen("miro.txt","rt"); 
if(maze_fp==NULL) {
	printf("실패-종료\n");
		exit(1);
}
fscanf(maze_fp,"%d",&row);
fscanf(maze_fp,"%d",&col); 

printf(" %d %d \n",row,col);
    for(i = 1;i<=row;i++) {
        for(j = 1;j<=col;j++) {
            fscanf(maze_fp,"%d",&maze[i][j]);
			printf("%d",maze[i][j]);
        }
		printf("\n");
	}
if(maze_fp!=NULL)
	fclose(maze_fp); 

for(i=0;i<=col+2;i++)
{
	maze[0][i]=1;
	maze[row+1][i]=1;
}

for(i=0;i<=row+2;i++)
{
	maze[i][col+1]=1;
	maze[i][0]=1;
}

printf("미로 출력\n");

for(i=0;i<=row+1;i++)
{   for(j=0;j<=col+1;j++)
		printf("%2d",maze[i][j]);
	printf("\n");
}
move[0].vert=-1;
move[0].horiz=0;

move[1].vert=-1;
move[1].horiz=1;

move[2].vert=0;
move[2].horiz=1;

move[3].vert=1;
move[3].horiz=1;

move[4].vert=1;
move[4].horiz=0;

move[5].vert=1;
move[5].horiz=-1;

move[6].vert=0;
move[6].horiz=-1;

move[7].vert=-1;
move[7].horiz=-1;
path(maze);
return 0;
}
