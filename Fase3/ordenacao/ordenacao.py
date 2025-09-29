def quick_sort(lista, chave_func):
    if len(lista) <= 1:
        return lista
    pivo = lista[len(lista) // 2]
    menores = [x for x in lista if chave_func(x) < chave_func(pivo)]
    iguais = [x for x in lista if chave_func(x) == chave_func(pivo)]
    maiores = [x for x in lista if chave_func(x) > chave_func(pivo)]
    return quick_sort(menores, chave_func) + iguais + quick_sort(maiores, chave_func)

def merge_sort(lista, chave_func):
    if len(lista) <= 1:
        return lista
    meio = len(lista) // 2
    esquerda = merge_sort(lista[:meio], chave_func)
    direita = merge_sort(lista[meio:], chave_func)
    return _merge(esquerda, direita, chave_func)

def _merge(esq, dir, chave_func):
    resultado = []
    i = j = 0
    while i < len(esq) and j < len(dir):
        if chave_func(esq[i]) <= chave_func(dir[j]):
            resultado.append(esq[i])
            i += 1
        else:
            resultado.append(dir[j])
            j += 1
    resultado.extend(esq[i:])
    resultado.extend(dir[j:])
    return resultado

def insertion_sort(lista, chave_func):
    for i in range(1, len(lista)):
        atual = lista[i]
        j = i - 1
        while j >= 0 and chave_func(lista[j]) > chave_func(atual):
            lista[j + 1] = lista[j]
            j -= 1
        lista[j + 1] = atual
    return lista
