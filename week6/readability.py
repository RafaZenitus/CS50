def main():

    text = input("Text:")

    s = sentences(text)
    l = letters(text)
    w = words(text)

    S = float(s) / w * 100
    L = float(l) / w * 100

    index = coleman(L, S)

    #print(f"Number of sentences: {s}")
    #print(f"Number of letters: {l}")
    #print(f"Number of words: {w}")
    #print(f"Index: {index}")

    if index < 1:
        print("Before Grade 1")
    elif 1 <= index <= 16:
        print(f"Grade {index}")
    else:
        print("Grade 16+")

def coleman(L, S):

    index = 0.0588 * L - 0.296 * S - 15.8
    num = round(index)
    return num

def sentences(text):
    count = 0
    types = {'.', '!', '?'}
    for i in range(len(text)):
        if text[i] in types:
            count += 1
    return count

def letters(text):
    count = 0
    for i in text:
        if i.isalpha() == True:
            count += 1
    return count

def words(text):
    word = len(text.split(" "))
    return word

main()
