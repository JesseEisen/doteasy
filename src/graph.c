#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "graph.h"

char content[4096];
int  used = 0;


void newgraph(char *type, char *rank)
{
    used += sprintf(content,"%s","digraph ast { fontname = \"PingFang\"; fontsize = 10; node [shape=\"plaintext\"];");
}

void nodeset(char *id, char *label)
{
    used += sprintf(content+used, "%s [label=%s];", id, label);

}

void appendraw(char *src, char *arrow, char *dst)
{
    used += sprintf(content+used, "%s%s%s;", src, arrow, dst);
}

void output()
{
    content[used] = '}';
    printf("%s\n", content);
}
