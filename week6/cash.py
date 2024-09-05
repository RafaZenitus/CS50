def main():
    while True:
        try:
            num = float(input("Change: "))
            if num < 0:
                print("Please enter a non-negative number.")
                continue
            break
        except ValueError:
            print("Invalid input. Please enter a valid float.")

    count(int(num * 100))

def count(num):
    quarters = 25
    dimes = 10
    nickels = 5
    pennies = 1

    quarters_count = 0
    dimes_count = 0
    nickels_count = 0
    pennies_count = 0

    while num > 0:
        if num >= quarters:
            num -= quarters
            quarters_count += 1
        elif num >= dimes:
            num -= dimes
            dimes_count += 1
        elif num >= nickels:
            num -= nickels
            nickels_count += 1
        elif num >= pennies:
            num -= pennies
            pennies_count += 1

    total = quarters_count + dimes_count + nickels_count + pennies_count
    print("Total coins:", total)

main()

