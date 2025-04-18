
#candles list
candles = [4,1,4,3]

#step 1
tallest = candles[0]
for i in candles:
    if i > tallest:
        tallest = i

#step 2
count = 0
for i in candles:
    if i == tallest:
        count +=1

#Result
print(f"The tallest candle has the value {tallest} and it appears {count} times.")
