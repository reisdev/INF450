#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef int32_t int_32 ;
typedef struct node node;

struct node {
    int_32 num;
    node *next;
};

void swap(node* prev_a, node* prev_b){
    node * aux;
    if(prev_a != NULL && prev_b != NULL){
        if(prev_a->next != NULL) {
            aux = prev_b->next;
            prev_b->next = NULL;
        }
        else if(prev_b->next == NULL) {
            
        }
    }
}

void foreach(node * head,int M, int size){
    int iterations = 0;
    while (iterations < M){
        node * prev_a = NULL;
        node * prev_b = NULL;

        int index = 0;
        int i = rand() % (size + 1);
        int j = rand() % (size + 1);
        node * aux = head;
        while( prev_a == NULL && prev_b == NULL){
            if(index+1 == i){
                prev_a = head;
            }
            if(index+1 == j){
                prev_b = head;
            }
            index++;
        }
    swap(prev_a,prev_b);
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

void printList(node* n){
    printf("\n\n ------- Print List -------- \n\n");
    int i = 0;
    while(n != NULL){
        printf("Node[%d] = %d \n",i,n->num);
        n = n->next;
        i++;
    }
    return;
}

int main(int argc, char **argv){
    long int size = atol(argv[1]);
    int X = atol(argv[2]);
    int M = atol(argv[3]);
    node* list = fillList(size);
    for(int i = 0;i < X; i++){
        foreach(list,M,size);
    }
}

