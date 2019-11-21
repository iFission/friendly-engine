import sys


def load_map(path):
    map_1 = []
    with open(path, 'r') as f:
        for line in f.readlines():
            current_line = []
            for grid in line.rstrip("\n").replace(",", ""):
                current_line.append(int(grid))
            map_1.append(current_line)
    return map_1


def display_map():
    print("\x1b[2J\x1b[H")
    for y in range(len(map_1)):
        print("".join(map(str, map_1[y])))
    print(f'PO: {portrait_orientation}')
    print(f'VO: {vertical_orientation}')
    print(f'HO: {horizontal_orientation}')
    print(f'{player_x, player_y, player_x2, player_y2}')


map_1 = load_map("map1.txt")

for y in range(len(map_1)):
    for x in range(len(map_1[0])):
        portrait_orientation = True
        horizontal_orientation = False
        vertical_orientation = False
        if map_1[y][x] == 2:
            player_x = int(x)
            player_y = int(y)
            player_x2 = 0
            player_y2 = 0
        if map_1[y][x] == 3:
            target_x = int(x)
            target_y = int(y)


def update_map():
    global map_1
    map_1 = load_map("map1.txt")
    map_1[player_y][player_x] = 4
    if player_x2 is not 0 and player_y2 is not 0:
        map_1[player_y2][player_x2] = 4


def check_move():
    if map_1[player_y][player_x] == 1:
        return True
    elif map_1[player_y][player_x] == 0:
        print("U DED LMAO")
        input()
        return False
    elif map_1[player_y][player_x] == 3:
        print("U WON")
        input()
        return False


def move(move_input):
    global player_x
    global player_y
    global player_x2
    global player_y2

    global portrait_orientation
    global horizontal_orientation
    global vertical_orientation

    if portrait_orientation:
        if move_input == ",":
            player_x = player_x
            player_y = player_y - 2
            player_x2 = player_x
            player_y2 = player_y + 1
            vertical_orientation = True
        elif move_input == "o":
            player_x = player_x
            player_y = player_y + 1
            player_x2 = player_x
            player_y2 = player_y + 1
            vertical_orientation = True
        elif move_input == "a":
            player_x = player_x - 2
            player_y = player_y
            player_x2 = player_x + 1
            player_y2 = player_y
            horizontal_orientation = True
        elif move_input == "e":
            player_x = player_x + 1
            player_y = player_y
            player_x2 = player_x + 1
            player_y2 = player_y
            horizontal_orientation = True
        portrait_orientation = False

    elif vertical_orientation:
        if move_input == ",":
            player_x = player_x
            player_y = player_y - 1
            player_x2 = 0
            player_y2 = 0
            vertical_orientation = False
            portrait_orientation = True
        elif move_input == "o":
            player_x = player_x
            player_y = player_y + 2
            player_x2 = 0
            player_y2 = 0
            vertical_orientation = False
            portrait_orientation = True
        elif move_input == "a":
            player_x = player_x - 1
            player_y = player_y
            player_x2 = player_x2 - 1
            player_y2 = player_y2
        elif move_input == "e":
            player_x = player_x + 1
            player_y = player_y
            player_x2 = player_x2 + 1
            player_y2 = player_y2

    elif horizontal_orientation:
        if move_input == ",":
            player_x = player_x
            player_y = player_y - 1
            player_x2 = player_x2
            player_y2 = player_y2 - 1
        elif move_input == "o":
            player_x = player_x
            player_y = player_y + 1
            player_x2 = player_x2
            player_y2 = player_y2 + 1
        elif move_input == "a":
            player_x = player_x - 1
            player_y = player_y
            player_x2 = 0
            player_y2 = 0
            horizontal_orientation = False
            portrait_orientation = True
        elif move_input == "e":
            player_x = player_x + 2
            player_y = player_y
            player_x2 = 0
            player_y2 = 0
            horizontal_orientation = False
            portrait_orientation = True
    check_move()


while (True):
    # move_up()
    update_map()
    display_map()
    move_input = input()
    move(move_input)
    update_map()
    display_map()