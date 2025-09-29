class Plataforma:
    def __init__(self, nome_plataforma, id_plataforma=None):
        if not nome_plataforma or not nome_plataforma.strip():
            raise ValueError("Nome da plataforma não pode ser vazio.")
        self._nome_plataforma = nome_plataforma.strip()
        self._id_plataforma = id_plataforma

    @property
    def nome_plataforma(self):
        return self._nome_plataforma

    @property
    def id_plataforma(self):
        return self._id_plataforma

    def __str__(self):
        return self._nome_plataforma

    def __repr__(self):
        return f"Plataforma(nome='{self._nome_plataforma}')"

    def __eq__(self, other):
        return isinstance(other, Plataforma) and self._nome_plataforma == other._nome_plataforma

    def __hash__(self):
        return hash(self._nome_plataforma)
