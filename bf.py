# Bloom Filter Implementation in Python
import hashlib

class BloomFilter:
    def __init__(self, size=20):
        self.size = size
        self.bit_array = [0] * size

    # Hash function 1
    def hash1(self, item):
        return int(hashlib.md5(item.encode()).hexdigest(), 16) % self.size

    # Hash function 2
    def hash2(self, item):
        return int(hashlib.sha1(item.encode()).hexdigest(), 16) % self.size

    # Insert operation
    def insert(self, item):
        index1 = self.hash1(item)
        index2 = self.hash2(item)
        self.bit_array[index1] = 1
        self.bit_array[index2] = 1
        print(f"Inserted '{item}' → bits set at positions {index1} and {index2}")

    # Lookup operation
    def lookup(self, item):
        index1 = self.hash1(item)
        index2 = self.hash2(item)
        if self.bit_array[index1] == 1 and self.bit_array[index2] == 1:
            print(f"'{item}' may be present (Possible True or False Positive)")
        else:
            print(f"'{item}' is definitely not present")

    # Display bit array
    def display(self):
        print("Current Bit Array:", self.bit_array)

# ---------------------- DRIVER CODE ----------------------

# Create Bloom Filter object
bf = BloomFilter(size=20)

# Insert elements into the Bloom Filter
bf.insert("John Don")
bf.insert("Jane Don")

# Display bit array after insertion
bf.display()

# Lookup existing and non-existing elements
print("\nLookup Operations:")
bf.lookup("John Don")     # Expected: May be present
bf.lookup("Jane Don")     # Expected: May be present
bf.lookup("James Bond")   # Expected: False positive possible
bf.lookup("John")         # Expected: Definitely not present
