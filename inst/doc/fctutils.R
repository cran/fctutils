## ----install, eval = FALSE----------------------------------------------------
#  library(devtools) # Load the devtools package
#  install_github("guokai8/fctutils") # Install the package

## -----------------------------------------------------------------------------
library(fctutils)
factor_vec <- factor(c('Apple', 'banana', 'Cherry', 'date', 'Fig', 'grape'))
# Reorder based on positions 1 and 3, case-insensitive
fct_pos(factor_vec, positions = c(1, 3))
# Reorder based on positions 3, case-insensitive, inplace = TRUE
fct_pos(factor_vec, positions = 3, inplace = TRUE)
# Reorder in decreasing order, case-sensitive
fct_pos(factor_vec, positions = 1:2, case = TRUE, decreasing = TRUE)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'apple', 'cherry', 'banana', 'banana', 'date'))

# Reorder levels by decreasing count
fct_count(factor_vec)
# Reorder levels by increasing count
fct_count(factor_vec, decreasing = FALSE)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('Apple', 'banana', 'Cherry', 'date', 'Fig', 'grape'))
# Reorder based on substring from position 2 to 4
fct_sub(factor_vec, start_pos = 2, end_pos = 4)

# Reorder from position 3 to end, case-sensitive
fct_sub(factor_vec, start_pos = 3, case = TRUE)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry', 'date', 'banana', 'apple', 'fig'))

# Reorder levels based on total character frequency
fct_freq(factor_vec)

# Reorder levels, case-sensitive
factor_vec_case <- factor(c('Apple', 'banana', 'Cherry', 'date', 'banana', 'apple', 'Fig'))
fct_freq(factor_vec_case, case = TRUE)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'apricot', 'cherry', 'banana', 'banana', 'date'))

# Reorder based on characters at positions 1 and 2
fct_char_freq(factor_vec, positions = 1:2)

# Reorder, case-sensitive, decreasing order
fct_char_freq(factor_vec, positions = c(1, 3), case = TRUE)

## -----------------------------------------------------------------------------

factor_vec <- factor(c('apple', 'banana', 'apricot', 'cherry', 'banana', 'banana', 'date'))
fct_substr_freq(factor_vec, start_pos = 2, end_pos=3)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'apricot', 'cherry', 'blueberry', 'blackberry', 'date'))

# Reorder based on pattern matching 'a'
fct_regex_freq(factor_vec, pattern = 'a')

# Reorder with case-sensitive matching
fct_regex_freq(factor_vec, pattern = '^[A-Z]', case = TRUE)

## -----------------------------------------------------------------------------
# Example factor vector with patterns
factor_vec <- factor(c('item1-sub1', 'atem2_aub2', 'item3|sub3', 'item1-sub4'))

# Split by patterns '-', '_', or '|' and reorder based on the first part
fct_split(factor_vec, split_pattern = c('-', '_', '\\|'), part = 1)

# Use the second pattern '_' for splitting
fct_split(factor_vec, split_pattern = c('-', '_', '\\|'), use_pattern = 2, part = 2)

# Reorder based on character frequencies in the specified part
fct_split(factor_vec, split_pattern = '-', part = 2, char_freq = TRUE)


## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry', 'date'))

# Sort levels by length
fct_len(factor_vec)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry', 'date'))
by_vec <- c(2, 3, 1, NA)
fct_sort(factor_vec, by = by_vec)

# Example using a data frame column
data <- data.frame(
  Category = factor(c('apple', 'banana', 'cherry', 'date')),
  Value = c(2, 3, 1, NA)
)
fct_sort(data$Category, by = data$Value)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry'))

# Sort levels by reverse alphabetical order
fct_sort_custom(factor_vec, function(x) -rank(x))

# Sort levels by length of the level name
fct_sort_custom(factor_vec, function(x) nchar(x))

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry', 'date', 'fig', 'grape'))

# replace 'banana' as 'blueberry', and keep original order
fct_replace(factor_vec, old_level = 'banana', new_level = 'blueberry')

# replace 'banana' as 'blueberry'
fct_replace(factor_vec, old_level = 'banana', new_level = 'blueberry', position = 2)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple_pie', 'banana_bread', 'cherry_cake'))

# Replace '_pie', '_bread', '_cake' with '_dessert'
fct_replace_pattern(factor_vec, pattern = '_.*', replacement = '_dessert')

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry', 'date', 'banana', 'apple', 'fig', NA))

# Filter levels occurring less than 2 times and reorder by character frequency
fct_filter_freq(factor_vec, min_freq = 2)

# Filter levels, remove NA values, and return additional information
result <- fct_filter_freq(factor_vec, min_freq = 2, na.rm = TRUE, return_info = TRUE)
result$filtered_factor
result$removed_levels
result$char_freq_table

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'apricot', 'cherry', 'date', 'fig', 'grape'))

# Remove levels where 'a' appears at position 1
fct_filter_pos(factor_vec, positions = 1, char = 'a')

# Remove levels where 'e' appears at positions 2 or 3
fct_filter_pos(factor_vec, positions = c(2, 3), char = 'e')

# Case-sensitive removal
factor_vec_case <- factor(c('Apple', 'banana', 'Apricot', 'Cherry', 'Date', 'Fig', 'grape'))
fct_filter_pos(factor_vec_case, positions = 1, char = 'A', case = TRUE)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry', 'date', 'fig', 'grape'))

# Remove levels 'banana' and 'date'
fct_remove_levels(factor_vec, levels_to_remove = c('banana', 'date'))

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry', 'date'))

# Remove levels that start with 'b'
fct_filter_func(factor_vec, function(x) !grepl('^b', x))

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'appel', 'banana', 'bananna', 'cherry'))

# Merge similar levels
fct_merge_similar(factor_vec, max_distance = 1)

## -----------------------------------------------------------------------------
factor_vec1 <- factor(c('apple', 'banana'))
factor_vec2 <- factor(c('cherry', 'date'))

# Concatenate factors
concatenated_factor <- fct_concat(factor_vec1, factor_vec2)
levels(concatenated_factor)

## -----------------------------------------------------------------------------
vector1 <- c('apple', 'banana', 'cherry')
vector2 <- c('date', 'fig', 'grape', 'honeydew')

# Combine and sort based on vector1 levels
fct_combine(vector1, vector2, sort_by = 1)

# Combine and sort based on vector2 levels
fct_combine(vector1, vector2, sort_by = 2)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('apple', 'banana', 'cherry', 'date', 'fig', 'grape'))
fct_insert(factor_vec, insert = 'date', target = 'banana', inplace = TRUE)
fct_insert(factor_vec, insert = c('date', 'grape'), positions = c(2, 4))
fct_insert(factor_vec, insert = 'honeydew', pattern = '^c')
factor_vec_na <- factor(c('apple', NA, 'banana', 'cherry', NA, 'date'))
fct_insert(factor_vec_na, insert = 'lychee', insert_after_na = TRUE)

## -----------------------------------------------------------------------------
factor_vec1 <- factor(c('apple', 'banana', 'cherry'))
factor_vec2 <- factor(c('banana', 'date', 'cherry'))
factor_vec3 <- factor(c('banana', 'cherry', 'fig'))

# Get intersection of levels
fct_intersect(factor_vec1, factor_vec2, factor_vec3)

## -----------------------------------------------------------------------------
factor_vec1 <- factor(c('apple', 'banana'))
factor_vec2 <- factor(c('banana', 'cherry'))
factor_vec3 <- factor(c('date', 'fig'))

# Get union of levels
fct_union(factor_vec1, factor_vec2, factor_vec3)

## -----------------------------------------------------------------------------
data <- data.frame(
  item = factor(c('A', 'B', 'C', 'D', 'E', 'F')),
  group = factor(c('G1', 'G1', 'G1', 'G2', 'G2', 'G2')),
  value = c(10, 15, 5, 20, 25, 15)
)
data <- rbind(data, data)
# Reorder 'item' within 'group' by 'value'
data$item <- fct_reorder_within(data$item, data$group, data$value, mean)

## -----------------------------------------------------------------------------
factor_vec <- factor(c('item123', 'item456', 'item789'))

# Extract numeric part
fct_extract(factor_vec, pattern = '\\d+')

# Extract with capturing group
factor_vec <- factor(c('apple: red', 'banana: yellow', 'cherry: red'))
fct_extract(factor_vec, pattern = '^(\\w+):', capture_group = 1)

## -----------------------------------------------------------------------------
# Example factor vector
factor_vec <- factor(c('A', 'B', 'C', 'D'))

# Pad levels to width 4 using '0' as padding character
padded_factor <- fct_pad_levels(factor_vec, width = 4, pad_char = '0')
print(levels(padded_factor))
# Output: "000A" "000B" "000C" "000D"

# Pad levels to width 6 using '%A' as padding string
padded_factor <- fct_pad_levels(factor_vec, width = 6, pad_char = '%A')
print(levels(padded_factor))
# Output: "%%A%A" "%%A%B" "%%A%C" "%%A%D"

