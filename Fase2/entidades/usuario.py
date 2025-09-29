class Usuario:
    def __init__(self, id_usuario):
        self._id_usuario = int(id_usuario)
        self._interacoes_realizadas = []

    @property
    def id_usuario(self):
        return self._id_usuario

    @property
    def interacoes_realizadas(self):
        return self._interacoes_realizadas

    def registrar_interacao(self, interacao):
        self._interacoes_realizadas.append(interacao)

    def calcular_contagem_por_tipo_interacao(self):
        contagem = {}
        for i in self._interacoes_realizadas:
            contagem[i.tipo_interacao] = contagem.get(i.tipo_interacao, 0) + 1
        return contagem

    def calcular_tempo_total_consumo(self):
        return sum(i.watch_duration_seconds for i in self._interacoes_realizadas)

    def calcular_media_tempo_consumo(self):
        tempos = [i.watch_duration_seconds for i in self._interacoes_realizadas if i.watch_duration_seconds > 0]
        return round(sum(tempos) / len(tempos), 3) if tempos else 0.0

    def listar_comentarios(self):
        return [i.comment_text for i in self._interacoes_realizadas if i.tipo_interacao == 'comment' and i.comment_text]

    def obter_conteudos_unicos_consumidos(self):
        return set(i.conteudo_associado for i in self._interacoes_realizadas)

    def plataformas_mais_frequentes(self, top_n=3):
        from collections import Counter
        plataformas = [i.plataforma_interacao for i in self._interacoes_realizadas]
        return Counter(plataformas).most_common(top_n)

    def __str__(self):
        return f"Usuario({self._id_usuario})"

    def __repr__(self):
        return f"Usuario(id={self._id_usuario})"