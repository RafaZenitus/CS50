#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Prompt for size
    int height;
    do
    {
        height = get_int("Piramid Height (1-8): ");
    }
    while (height > 8 || height < 1);

    // Building the piramid

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < height; j++)
        {
            if (i + j < height - 1)
                printf(" ");
            else
                printf("#");
        }
        printf("\n");
    }
}