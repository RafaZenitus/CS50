#include <cs50.h>
#include <stdio.h>

const int N = 3;

float average(int length, int array[]);

int main (void)
{
    int scores [N];
    for (int i = 0; i < N; i++)
    {
        scores [i] = get_int("Score: ");
    }

    printf("Average: %f\n", average(N, scores));
}

float average(int length, int array [])
{
    int sum = 0;
    for (int i = 0; i < length; i++)
    {
        sum += array[i];
    }
    return sum / (float) length;
}
// %i -> result = int
// se %f (float) -> (scores[0] + scores[1] + scores[2]) / 3.0); ou (scores[0] + scores[1] + scores[2])  / (float) 3);