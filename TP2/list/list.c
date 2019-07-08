#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef int32_t int_32 ;
typedef struct node node;

struct node {
    int_32 num;
    node *next;
};

void print(node* n){
    printf("\n\n ------- Print List -------- \n\n");
    int i = 0;
    while(n != NULL){
        printf("Node[%d] = %d   ->   ",i,n->num);
        n = n->next;
        i++;
    }
    return;
}

void free_list(struct node* head)
{  
  node* current = head;
  node* next;
  while (current != NULL) {
    next = current->next;
    free(current);
    current = next;
  }
  head = NULL;
}

void swap(node * head,long int i,long int j){
    if(i == j) return;
    int index = 0;
    node *prevA = NULL,*a = head;
    while(a && index != i){
        prevA = a;
        a = a->next;
        index++;
    }

    index = 0;
    node *prevB = NULL,*b = head;
    while(b && index != j){
        prevB = b;
        b = b->next;
        index++;
    }

    if( a == NULL && b == NULL) return;

    if(prevA != NULL) prevA->next = b;
    else head = b;

     if(prevB != NULL) prevB->next = a;
     else head = a;

     node * aux = b->next;
     b->next = a->next;
     a->next = aux;
     return;
}

void foreach(node * head,int M, int size){
    int iterations = 0;
    while (iterations < M){
        long int i = rand() % (size + 1);
        long int j = rand() % (size + 1);
        swap(head,i,j);
    iterations++;
    }
}

node * fillList(int size){
    int n = 0;
    node * head;
    head= malloc(sizeof(node));
    head->next = NULL;
    head->num = (int_32) rand();
    node * prev;
    prev = head;
    while (n < size){
        prev->next = malloc(sizeof(node));
        prev->next->num = rand();
        prev->next->next = NULL;
        prev = prev->next;
        n++;
    }
    return head;
}

int main(int argc, char **argv){
    long int size = atol(argv[1]);
    int X = atol(argv[2]);
    int M = atol(argv[3]);
    node* list = fillList(size);
    for(int i = 0;i < X; i++){
        foreach(list,M,size);
    }   
    free_list(list);
}

