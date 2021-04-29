from itertools import product

def check_user_input(n):
    try:
        # Convert it into integer
        n = int(n)
        if 2 <= n < 65:
            return n
        else:
            print('Input is out of range. The number of bits must be between 2 and 64')
    except ValueError:
        print('Input is not a number. It is a string')

arr = 0
val_x = []
val_y = []


if __name__ == '__main__':

    N = input('Please enter how many bits the operands should be: ')
    line = '-' * 50

    print(line)
    N = check_user_input(N)
    print(line)

    if N is type(int):
        for x in range(N + 1):
            for y in range(N + 1):
                if y == 0:
                    arr += 1
            if arr == 1:
                val_x.append(bin(x)[2:].zfill(N))
                val_y.append(bin(x)[2:].zfill(N))
            arr = 0