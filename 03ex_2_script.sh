tail -n +2 data.csv | tr ',' ' ' > data.txt
# Count even numbers in data.txt
grep -oE '\b[0-9]+\b' data.txt | awk '{if ($1 % 2 == 0) print $1}' | wc -l
# Set the threshold value
threshold=$(echo "100 * sqrt(3) / 2" | bc -l)

# Initialize counters
greater=0
smaller=0

# Loop through data.txt and perform the calculation for each line (X, Y, Z)
while read X Y Z; do
    distance=$(echo "sqrt($X^2 + $Y^2 + $Z^2)" | bc -l)
    if (( $(echo "$distance > $threshold" | bc -l) )); then
        ((greater++))
    else
        ((smaller++))
    fi
done < data.txt

echo "Entries greater than threshold: $greater"
echo "Entries smaller than or equal to threshold: $smaller"
# Input for the number of copies (n)
read -p "Enter the number of copies (n): " n

# Loop through 1 to n and create copies
for ((i=1; i<=n; i++)); do
    # Create a new file with numbers divided by i
    awk -v i=$i '{for (j=1; j<=NF; j++) $j = $j / i}1' data.txt > "data_copy_$i.txt"
    echo "Created data_copy_$i.txt"
done
