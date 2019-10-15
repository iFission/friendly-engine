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


map_1 = load_map("bloxorz-python/map1.txt")

for y in range(len(map_1)):
    for x in range(len(map_1[0])):
        if map_1[y][x] == 2:
            player_x = int(x)
            player_y = int(y)
        if map_1[y][x] == 3:
            target_x = int(x)
            target_y = int(y)


def update_map():
    global map_1
    map_1 = load_map("bloxorz-python/map1.txt")
    map_1[player_y][player_x] = 4


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


def move_left():
    global player_x
    player_x -= 1
    check_move()


def move_right():
    global player_x
    player_x += 1
    check_move()


def move_up():
    global player_y
    player_y -= 1
    check_move()


def move_down():
    global player_y
    player_y += 1
    check_move()


while (True):
    # move_up()
    update_map()
    display_map()
    move = input()
    if move == ",":
        move_up()
    elif move == "o":
        move_down()
    elif move == "a":
        move_left()
    elif move == "e":
        move_right()
    update_map()
    display_map()