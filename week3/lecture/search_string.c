#include <cs50.h>
#include <stdio.h>
#include <string.h>

const int N = 6;

int main(void)
{
    string strings[] = {"battleship", "boot", "cannon", "iron", "thimble", "top hat"};

    string s = get_string("String: ");
    for (int i = 0; i < N; i++)
    {
        if (strcmp (strings[i], s) == 0) // strcmp compare two strings -> int strcmp(string s1, string s2);
        {
            printf("Found at position %d\n", i + 1);
            return 0;
        }
    }
    printf("Not found\n");
    return 1;
}
