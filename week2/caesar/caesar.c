#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    for (int i = 0; i < strlen(argv[1]); i++)
    {
        if (!isdigit(argv[1][i]))
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }

    int key = atoi(argv[1]);

    string plain_text = get_string("plaintext: \n");
    printf("ciphertext: \n");

    for (int j = 0; j < strlen(plain_text); j++)
    {
        if (isupper(plain_text[j]))
        {
            printf("%c", (plain_text[j] - 65 + key) % 26 + 65);
        }

        else if (islower(plain_text[j]))
        {
            printf("%c", (plain_text[j] - 97 + key) % 26 + 97);
        }

        else
        {
            printf("%c", plain_text[j]);
        }
    }

    printf("\n");
}

/*
./caesar 3
argc -> 2
argv -> ./caesar 3
argv[0] -> "./caesar"
argv[1] -> "3"

atoi - convert a string to an int

isalpha('A') -> true
islower('A') -> true
isupper('A') -> false
*/
