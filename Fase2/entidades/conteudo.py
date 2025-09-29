from abc import ABC, abstractmethod

class Conteudo(ABC):
    def __init__(self, id_conteudo, nome_conteudo, duracao_total):
        self._id_conteudo = int(id_conteudo)
        self._nome_conteudo = nome_conteudo.strip()
        self._duracao_total = int(duracao_total)
        self._interacoes = []

    @property
    def id_conteudo(self):
        return self._id_conteudo

    @property
    def nome_conteudo(self):
        return self._nome_conteudo

    @property
    def duracao_total(self):
        return self._duracao_total

    def adicionar_interacao(self, interacao):
        self._interacoes.append(interacao)

    def calcular_total_interacoes_engajamento(self):
        return sum(1 for i in self._interacoes if i.tipo_interacao in {'like', 'share', 'comment', 'vote_bbb'})

    def calcular_contagem_por_tipo_interacao(self):
        contagem = {}
        for i in self._interacoes:
            contagem[i.tipo_interacao] = contagem.get(i.tipo_interacao, 0) + 1
        return contagem

    def calcular_tempo_total_consumo(self):
        return sum(i.watch_duration_seconds for i in self._interacoes)

    def calcular_media_tempo_consumo(self):
        tempos = [i.watch_duration_seconds for i in self._interacoes if i.watch_duration_seconds > 0]
        return round(sum(tempos) / len(tempos), 3) if tempos else 0.0

    def listar_comentarios(self):
        return [i.comment_text for i in self._interacoes if i.tipo_interacao == 'comment' and i.comment_text]

    def __str__(self):
        return self._nome_conteudo

    def __repr__(self):
        return f"Conteudo(id={self._id_conteudo}, nome='{self._nome_conteudo}')"

    @abstractmethod
    def tipo_conteudo(self):
        pass


class Video(Conteudo):
    def tipo_conteudo(self):
        return "vídeo"

class Podcast(Conteudo):
    def tipo_conteudo(self):
        return "podcast"

class Artigo(Conteudo):
    def tipo_conteudo(self):
        return "artigo"
