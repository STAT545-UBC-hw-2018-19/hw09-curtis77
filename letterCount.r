words <- readLines("words.txt")
counts <- rep(0, 26)
names(counts) <- letters
for (word in words) {
    firstLetter = substr(word, 1, 1)
    if (firstLetter %in% letters) {
      counts[firstLetter] = counts[firstLetter] + 1
    }
}
counts <- unname(counts)
df <- data.frame("Letters" = letters, "Count" = counts)
write.csv(df, "letterCount.csv")
