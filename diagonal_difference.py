def diagonal_difference(matrix):
  total1 = total2 = 0
  for i in range (len(matrix)):
    total1 += matrix[i][i]
    total2 += matrix[i][len(matrix) - 1 - i]
  return abs(total1 - total2)

matrix1=[
    [1,2,3],
    [4,5,6],
    [9,8,9]
]
matrix2=[
    [11,2,4],
    [4,5,6],
    [10,8,-12]
]

print(diagonal_difference(matrix1))
print(diagonal_difference(matrix2))
