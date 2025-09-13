const board = document.getElementById('board');
const message = document.getElementById('message');
const resetButton = document.getElementById('resetGame');
const startButton = document.getElementById('startGame');
const score1El = document.getElementById('score1');
const score2El = document.getElementById('score2');

let currentPlayer = 'X';
let player1Symbol = 'X';
let player2Symbol = 'O';
let boardState = Array(9).fill('');
let score1 = 0;
let score2 = 0;
let gameActive = false;

const winningCombos = [
  [0,1,2],[3,4,5],[6,7,8], // linhas
  [0,3,6],[1,4,7],[2,5,8], // colunas
  [0,4,8],[2,4,6]          // diagonais
];

function createBoard() {
  board.innerHTML = '';
  boardState = Array(9).fill('');
  for (let i = 0; i < 9; i++) {
    const cell = document.createElement('div');
    cell.classList.add('cell');
    cell.dataset.index = i;
    cell.textContent = '';
    cell.style.color = ''; // Limpa cor antiga
    cell.addEventListener('click', handleMove);
    board.appendChild(cell);
    }
}

function handleMove(e) {
  if (!gameActive) return;

  const index = e.target.dataset.index;
  if (boardState[index] !== '') return;

  boardState[index] = currentPlayer;
  e.target.textContent = currentPlayer;

  // Aplica a cor conforme o jogador atual
  if(currentPlayer === player1Symbol) {
    e.target.style.color = player1Color;
  } else {
    e.target.style.color = player2Color;
  }

  if (checkWin()) {
    message.textContent = `Jogador ${currentPlayer} venceu!`;
    if (currentPlayer === player1Symbol) score1++; else score2++;
    updateScore();
    gameActive = false;
    return;
  }

  if (!boardState.includes('')) {
    message.textContent = 'Empate!';
    gameActive = false;
    return;
  }

  currentPlayer = currentPlayer === player1Symbol ? player2Symbol : player1Symbol;
  message.textContent = `Vez do jogador ${currentPlayer}`;
}

function checkWin() {
  return winningCombos.some(combo => 
    combo.every(i => boardState[i] === currentPlayer)
  );
}

function updateScore() {
  score1El.textContent = score1;
  score2El.textContent = score2;
}

resetButton.addEventListener('click', () => {
  createBoard();
  message.textContent = `Vez do jogador ${player1Symbol}`;
  currentPlayer = player1Symbol;
  gameActive = true;
});

startButton.addEventListener('click', () => {
  player1Symbol = document.getElementById('player1').value;
  player2Symbol = document.getElementById('player2').value;

  player1Color = document.getElementById('player1Color').value;
  player2Color = document.getElementById('player2Color').value;

  if (player1Symbol === player2Symbol) {
    alert('Jogadores não podem escolher o mesmo símbolo!');
    return;
  }
    if (player1Color === player2Color) {
    alert('Jogadores não podem escolher a mesma cor!');
    return;
  }

  createBoard();
  message.textContent = `Vez do jogador ${player1Symbol}`;
  currentPlayer = player1Symbol;
  gameActive = true;
});