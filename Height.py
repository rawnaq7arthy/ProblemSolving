h = int(input("Enter Height: "))

for i in range(h):
    print('  ' * (h - i - 1), end='')

    # Left side
    x = 1
    for j in range(i + 1):
        print(x, end=' ')
        x *= 2

    # Right side
    x //= 4
    for j in range(i):
        print(x, end=' ')
        x //= 2

    print()
