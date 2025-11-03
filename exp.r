EX9

# Basic arithmetic operations
a <- 10
b <- 20
sum <- a + b
print(sum)

# Create a vector
v <- c(2, 4, 6, 8, 10)
print(v)
u <- c(3, 5, 2, 8, 6)
print(u)
# Basic statistics
mean(v)
max(v)
min(v)
sd(v)

# Create a data frame
data <- data.frame(Name = c("Kartik", "Riya", "Aman"),
                   Age = c(21, 23, 22),
                   Marks = c(88, 92, 79))
print(data)
#type can be b= both , p=point, l=line
plot(v, u, type="b", col="blue", 
     main="Custom X and Y Plot",
     xlab="v (X-axis)", ylab="u (Y-axis)")

hist(v, col="lightgreen", main="Histogram of v")





EX10

# ============================================================
# Experiment No. 10
# Aim: Using R, perform data processing and data visualization.
# ============================================================

# Step 1: Create simple numeric vectors
v <- c(2, 4, 6, 8, 10)
u <- c(1, 3, 5, 7, 9)

# Step 2: Display data
print("Vector v values:")
print(v)

print("Vector u values:")
print(u)

# Step 3: Basic statistics
mean_v <- mean(v)
median_v <- median(v)
sd_v <- sd(v)

print(paste("Mean of v:", mean_v))
print(paste("Median of v:", median_v))
print(paste("Standard Deviation of v:", round(sd_v, 2)))

# ============================================================
# Step 4: Simple Line Plot (Base R)
# ============================================================
plot(v, u, type = "b", col = "blue",
     main = "Custom X and Y Plot",
     xlab = "v (X-axis)", ylab = "u (Y-axis)")

# ============================================================
# Step 5: Histogram (Base R)
# ============================================================
dev.new()  # open new plotting window
hist(v, col = "lightgreen",
     main = "Histogram of v",
     xlab = "Values", ylab = "Frequency")

# ============================================================
# Step 6: Data Visualization using ggplot2
# ============================================================

# Install packages (run only once)
install.packages(c("ggplot2", "dplyr", "magrittr"))

# Load libraries
library(ggplot2)
library(dplyr)
library(magrittr)

# Prepare data from built-in dataset 'mtcars'
data_histogram <- mtcars %>%
  mutate(cyl = factor(cyl)) %>%
  group_by(cyl) %>%
  summarize(mean_mpg = round(mean(mpg), 2))

# ============================================================
# Step 7: Bar Plot using ggplot2
# ============================================================
dev.new()
ggplot(data_histogram, aes(x = cyl, y = mean_mpg, fill = cyl)) +
  geom_bar(stat = "identity") +
  labs(title = "Average MPG by Cylinder Count",
       x = "No. of Cylinders", y = "Mean MPG") +
  theme_minimal()

# ============================================================
# Step 8: Histogram using ggplot2
# ============================================================
dev.new()
ggplot(mtcars, aes(x = mpg, fill = cyl)) +
  geom_histogram(bins = 10, color = "black") +
  labs(title = "Distribution of Miles per Gallon (MPG)",
       x = "MPG", y = "Count") +
  theme_light()

# ============================================================
# Step 9: Scatter Plot using ggplot2
# ============================================================
dev.new()
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(title = "MPG vs Weight by Cylinder Count",
       x = "Weight (1000 lbs)", y = "Miles per Gallon") +
  theme_classic()
