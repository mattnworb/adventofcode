
def count_floors(s):
    """
    If `(` means move up one floor and `)` means move down one floor, this
    function returns the count of what floor the elevator will end up on.
    """
    count = 0
    for c in s:
        if c == '(':
            count += 1
        elif c == ')':
            count -= 1
    return count

if __name__ == '__main__':
    import sys
    with open(sys.argv[1]) as f:
        instructions = f.readlines()
    print count_floors("".join(instructions))
