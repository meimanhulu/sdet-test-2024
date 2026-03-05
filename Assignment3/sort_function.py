def sort_even_odd_desc(arr):
    """
    Sorts the array with even numbers first, then odd numbers,
    both in descending order.
    """
    evens = sorted([x for x in arr if x % 2 == 0], reverse=True)
    odds = sorted([x for x in arr if x % 2 != 0], reverse=True)
    return evens + odds

# Test
input_arr = [3, 2, 5, 1, 8, 9, 6]
output = sort_even_odd_desc(input_arr)
print("Input:", input_arr)
print("Output:", output)

# Expected: [8, 6, 2, 9, 5, 3, 1]