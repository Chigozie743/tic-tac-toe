//define variables
import 'dart:math';

var player = 'X';
var automaticMode = false;
var gameRunning = false;
var gameWon = false;
var message = "Player $player";

List playground = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];

//functions
void changePlayer() {
  if (player == 'X') {
    player = 'O';
  } else {
    player = 'X';
  }
  message = "Player $player";
}

void refreshPlayground() {
  playground.fillRange(0, 9, '');
  player = 'X';
  message = "Player $player";
  gameRunning = false;
  gameWon = false;
}

void setPlayerOnPlayground(index) {
  gameRunning = true;
  if (playground[index] == '' && !gameWon) {
    playground[index] = player;
    if (checkGameWin(player)) {
      gameWon = true;
      message = 'Player $player won';
    } else {
      checkTie();
    }

    if (!gameWon) {
      changePlayer();
      message = 'Player $player';
    }
    if (automaticMode && player == 'O') {
      autoRun();
    }
  }
}

bool checkGameWin(currentPlayer) {
  var checkField = currentPlayer + currentPlayer + currentPlayer;
  if (playground[0] + playground[1] + playground[2] == checkField || playground[3] + playground[4] + playground[5] == checkField || playground[6] + playground[7] + playground[8] == checkField || playground[0] + playground[3] + playground[6] == checkField || playground[1] + playground[4] + playground[7] == checkField || playground[2] + playground[5] + playground[8] == checkField || playground[0] + playground[4] + playground[8] == checkField || playground[2] + playground[4] + playground[6] == checkField) {
    return true;
  } else {
    return false;
  }
}

void checkTie() {
  if (playground.indexOf('') == -1) {
    gameWon = true;
    message = '- TIE -';
  }
}

void autoRun() {
  //Check own winning
  for (int i = 0; i < 9; i++) {
    if (playground[i] == '') {
      playground[i] = 'O';
      if (checkGameWin('O')) {
        playground[i] = '';
        setPlayerOnPlayground(i);
        return;
      } else {
        playground[i] = '';
      }
    }
  }
  //Check enemy winning
  for (int i = 0; i < 9; i++) {
    if (playground[i] == '') {
      playground[i] = 'X';
      if (checkGameWin('X')) {
        playground[i] = '';
        setPlayerOnPlayground(i);
        return;
      } else {
        playground[i] = '';
      }
    }
  }
  //Set random field
  Random rnd = new Random();
  int rndNumber = rnd.nextInt(9);
  while (playground[rndNumber] == 'X' || playground[rndNumber] == 'O') {
    rndNumber = rnd.nextInt(9);
  }
  setPlayerOnPlayground(rndNumber);
}
