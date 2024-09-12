@outputSchema("word: chararray")
def to_upper(word):
    if word is None:
        return None
    return word.upper()
