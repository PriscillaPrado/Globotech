class NoBST:
    def __init__(self, chave, valor):
        self.chave = chave
        self.valor = valor
        self.esq = None
        self.dir = None

class ArvoreBinariaBusca:
    def __init__(self):
        self.raiz = None

    def inserir(self, chave, valor):
        self.raiz = self._inserir(self.raiz, chave, valor)

    def _inserir(self, no, chave, valor):
        if no is None:
            return NoBST(chave, valor)
        if chave < no.chave:
            no.esq = self._inserir(no.esq, chave, valor)
        elif chave > no.chave:
            no.dir = self._inserir(no.dir, chave, valor)
        return no

    def buscar(self, chave):
        return self._buscar(self.raiz, chave)

    def _buscar(self, no, chave):
        if no is None:
            return None
        if chave == no.chave:
            return no.valor
        if chave < no.chave:
            return self._buscar(no.esq, chave)
        else:
            return self._buscar(no.dir, chave)

    def percurso_em_ordem(self):
        resultado = []
        self._em_ordem(self.raiz, resultado)
        return resultado

    def _em_ordem(self, no, resultado):
        if no is not None:
            self._em_ordem(no.esq, resultado)
            resultado.append(no.valor)
            self._em_ordem(no.dir, resultado)
