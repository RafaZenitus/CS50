def main():
    while True:
        try:
            size = int(input("Size: "))
            if 1 <= size <= 8:
                break
        except ValueError:
            print("Invalid input. Please enter a valid integer.")
    print_square(size)


def print_square(size):
    # for each row in sqare
    for i in range(size):
        #for each brick in row
        for j in range(size):
            #print brick
            if(i + j < size - 1):
                print(" ", end="")
            else:
                print("#", end="")
        print()

main()
