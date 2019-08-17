def print_board(board):
    for row in board:
        print(" | ".join(row))
        print("-" * 9)

def check_winner(board, player):
    # Check rows, columns, diagonals
    for i in range(3):
        if all(s == player for s in board[i]):  # row
            return True
        if all(row[i] == player for row in board):  # column
            return True
    if all(board[i][i] == player for i in range(3)):  # main diagonal
        return True
    if all(board[i][2 - i] == player for i in range(3)):  # anti-diagonal
        return True
    return False

def board_full(board):
    return all(cell != " " for row in board for cell in row)

def tic_tac_toe():
    board = [[" "]*3 for _ in range(3)]
    players = ["X", "O"]
    turn = 0

    while True:
        print_board(board)
        player = players[turn % 2]
        print(f"Player {player}'s turn.")
        
        try:
            row = int(input("Enter row (1-3): ")) - 1
            col = int(input("Enter col (1-3): ")) - 1
            if row not in range(3) or col not in range(3):
                print("Invalid position. Try again.")
                continue
            if board[row][col] != " ":
                print("Cell already taken. Try again.")
                continue
            board[row][col] = player
        except ValueError:
            print("Invalid input. Enter numbers only.")
            continue

        if check_winner(board, player):
            print_board(board)
            print(f"Player {player} wins!")
            break

        if board_full(board):
            print_board(board)
            print("It's a draw!")
            break

        turn += 1

if __name__ == "__main__":
    tic_tac_toe()
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733291
