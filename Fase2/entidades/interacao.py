from datetime import datetime

class Interacao:
    # Tipos válidos de interação conforme proposta
    TIPOS_INTERACAO_VALIDOS = {'view_start', 'like', 'share', 'comment', 'vote_bbb'}

    def __init__(self, id_usuario, timestamp, tipo, duracao, comentario, conteudo, plataforma):
        # Validação do tipo de interação
        tipo = tipo.strip().lower()
        if tipo not in Interacao.TIPOS_INTERACAO_VALIDOS:
            raise ValueError(f"Tipo de interação inválido: '{tipo}'")

        self._id_usuario = id_usuario
        self._timestamp_interacao = datetime.fromisoformat(timestamp)
        self._tipo_interacao = tipo
        self._watch_duration_seconds = duracao
        self._comment_text = comentario
        self._conteudo_associado = conteudo
        self._plataforma_interacao = plataforma

    @property
    def tipo_interacao(self):
        return self._tipo_interacao

    @property
    def watch_duration_seconds(self):
        return self._watch_duration_seconds

    @property
    def comment_text(self):
        return self._comment_text

    @property
    def conteudo_associado(self):
        return self._conteudo_associado

    @property
    def plataforma_interacao(self):
        return self._plataforma_interacao

    def __str__(self):
        return f"Interação({self._tipo_interacao})"

    def __repr__(self):
        return f"Interacao(tipo={self._tipo_interacao}, usuario={self._id_usuario})"
