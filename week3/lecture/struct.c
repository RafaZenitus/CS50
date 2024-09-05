#include <cs50.h>
#include <stdio.h>
#include <string.h>

const int N = 2;

typedef struct
{
    string name;
    string number;
}
person;

int main (void)
{
    person people [N];

    people [0].name = "Bob";
    people [0].number = "(99) 9 9999-9999";

    people [1].name = "Rob";
    people [1].number = "(99) 9 9999-9999";

    string name = get_string ("Name:");
    for (int i = 0; i < N; i++)
    {
        if (strcmp(people[i].name, name) == 0)
        {
            printf("Found %s\n", people[i].number);
            return 0;
        }
    }

    printf("Not found\n");
    return 1;
}