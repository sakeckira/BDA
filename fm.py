# Flajolet-Martin Algorithm to estimate unique elements in a data stream

import hashlib

# Function to count trailing zeros in binary representation
def count_trailing_zeros(num):
    binary = bin(num)[2:]        # Convert to binary string
    return len(binary) - len(binary.rstrip('0'))

# Hash function (maps input to integer)
def hash_value(x):
    h = hashlib.sha1(x.encode()).hexdigest()   # SHA-1 hash
    return int(h[:8], 16)                      # Take first 8 hex digits as integer

# Main Flajolet-Martin function
def flajolet_martin(stream):
    R = 0   # Maximum number of trailing zeros
    for item in stream:
        hv = hash_value(str(item))
        r = count_trailing_zeros(hv)
        R = max(R, r)
    # Estimated distinct elements = 2^R
    return 2 ** R

# ---------------------- DRIVER CODE ----------------------

# Example data stream (you can change or take input)
data_stream = ['a', 'b', 'c', 'a', 'b', 'd', 'e', 'f', 'g', 'a', 'h', 'i', 'j']

print("Data Stream:", data_stream)

# Actual distinct count
true_unique = len(set(data_stream))

# Estimate using FM Algorithm
estimated_unique = flajolet_martin(data_stream)

# Display Results
print("True Unique Elements:", true_unique)
print("Estimated Unique Elements (Flajolet-Martin):", estimated_unique)
