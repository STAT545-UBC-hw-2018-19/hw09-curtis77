words <- readLines("words.txt")
counts <- rep(0, 26)
names(counts) <- letters
for (word in words) { # loops through each word
    firstLetter = substr(word, 1, 1) # extracts first letter of word
    if (firstLetter %in% letters) { # if statement checks if the first letter of the word is a lower case letter
      counts[firstLetter] = counts[firstLetter] + 1
    }
}
counts <- unname(counts)
df <- data.frame("Letters" = letters, "Count" = counts)
write.csv(df, "letterCount.csv")
