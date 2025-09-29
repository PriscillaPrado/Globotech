from collections import deque

class Fila:
    def __init__(self):
        self._fila = deque()

    def enfileirar(self, elemento):
        self._fila.append(elemento)

    def desenfileirar(self):
        if self.esta_vazia():
            raise IndexError("Fila vazia")
        return self._fila.popleft()

    def esta_vazia(self):
        return len(self._fila) == 0

    def tamanho(self):
        return len(self._fila)
