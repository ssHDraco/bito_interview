def order(sentence):
    sorted_list = sorted(sentence.split(), key=get_num)
    sorted_str = " ".join(sorted_list)

    return sorted_str

def get_num(word):
    for letter in word:
        if letter.isdigit():
            return int(letter)
