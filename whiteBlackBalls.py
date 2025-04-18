white = int(input("White balls: "))
black = int(input("Black balls: "))

row = 1
height = 1

while True:
    if row % 2 and white >= row:
        white -= row
        height = row
    elif row % 2 == 0 and black >= row:
        black -= row
        height = row
    else:
        break
    row +=1
print("Height: ", height)