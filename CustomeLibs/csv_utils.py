import csv

def read_csv(filename):
    data = []
    with open(filename, 'r') as csvfile:
        reader = csv.reader(csvfile)
        headers = next(reader)  # Skip the header row
        for row in reader:
            data.append(dict(zip(headers, row)))
    return data
