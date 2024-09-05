#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int numbers[] = {20, 500, 10, 5, 100, 1, 5};

    int n = get_int("Numbers: ");
    for (int i = 0; i < 7; i++)
    {
        if (numbers[i] == n)
        {
            printf("Found at position %d\n", i + 1);
            return 0;
        }
    }
    printf("Not found\n");
    return 0;
}