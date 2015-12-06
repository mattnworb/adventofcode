def calculate_paper(dimensions):
    """
    Fortunately, every present is a box (a perfect right rectangular prism),
    which makes calculating the required wrapping paper for each gift a little
    easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l.
    The elves also need a little extra paper for each present: the area of the
    smallest side.
    """
    w, l, h = [int(s) for s in dimensions.split("x")]

    return 2 * l * w + \
           2 * w * h + \
           2 * h * l + \
           min(l * w, w * h, h * l)

if __name__ == '__main__':
    import sys
    total = 0
    with open(sys.argv[1]) as f:
        for line in f:
            total += calculate_paper(line)
    print total
